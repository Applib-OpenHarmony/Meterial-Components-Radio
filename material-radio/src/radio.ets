/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { RadioModel } from './radioModel';
import { RadioOption } from './radioOption';

@Component
export struct RadioGroup {
  @State private options: RadioOption [] = []
  @State private selectedRadioId: number = -1
  private onCheckChange: ((id: number) => void) = null

  aboutToAppear() {
    if (this.options == undefined) {
      this.options = []
    }

    if (this.selectedRadioId == null) {
      this.selectedRadioId = -1
    }
  }

  build() {
    Column() {
      List() {
        ForEach(
          this.options,
          (item) => {
            ListItem() {
              RadioButton({
                model: new RadioModel(item.id, item.label),
                checked: item.id == this.selectedRadioId,
                onCheckChange: (id) => {
                  this.selectedRadioId = id
                  if (this.onCheckChange != null) {
                    this.onCheckChange(id);
                  }
                }
              })
            }
          },
          item => item.id
        )
      }
    }
  }
}

@Component
export struct RadioButton {
  @State checked: boolean = false
  @State model: RadioModel = undefined
  private onCheckChange: ((id: number) => void) = null

  aboutToAppear() {
    if (this.model == undefined) return

    if (this.model.isDisabled()) {
      this.model.setRingOpacity(0.7)
    }

    if (this.checked) {
      this.model.setInnerScale(1)
    }
  }

  private onClick() {
    if (this.model.isDisabled()) return
    if (!this.checked) this.showInnerRing()
    this.startRippleEffect()
  }

  private showInnerRing() {
    this.checked = true

    if (this.onCheckChange != null) {
      this.onCheckChange(this.model.getRadioId());
    }

    animateTo({ duration: 250 }, () => {
      this.model.setInnerScale(1)
    })
  }

  private hideInnerRing() {
    animateTo({ duration: 250 }, () => {
      this.checked = false
      this.model.setInnerScale(0)
    })
  }

  private startRippleEffect() {
    this.model.setRippleVisible(true)
    animateTo({
      duration: 500,
      onFinish: () => {
        this.model.setRippleScale(0)
        this.model.setRippleVisible(false)
      }
    }, () => {
      this.model.setRippleScale(2.4)
    })
  }

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          Stack() {
            Stack() {
              Circle({ width: '16vp', height: '16vp' })
                .borderRadius('8vp')
                .opacity(this.model.getRingOpacity())
                .fill(this.checked ? this.model.getRingColor() : Color.White)
                .scale({ x: this.model.getInnerScale(), y: this.model.getInnerScale() })

              Circle({ width: '16vp', height: '16vp' })
                .opacity(.2)
                .borderRadius('8vp')
                .fill(this.model.getRingColor())
                .scale({ x: this.model.getRippleScale(), y: this.model.getRippleScale() })
                .visibility(this.model.getRippleVisible() ? Visibility.Visible : Visibility.Hidden)
            }
            .width('20vp')
            .height('20vp')
            .borderRadius('10vp')
            .backgroundColor(Color.White)
          }
          .margin('4vp')
          .width('24vp')
          .height('24vp')
          .borderRadius('12vp')
          .opacity(this.model.getRingOpacity())
          .backgroundColor(this.model.getRingColor())

          Text(this.model.getRadioLabel())
            .fontSize('16vp')
            .margin({ left: '8vp', right: '16vp' })
        }.width('100%')
      }
      .margin(8)
      .padding(4)
      .onClick(() => this.onClick())
    }
  }
}

export { RadioOption } from "./radioOption";

export { RadioModel } from "./radioModel";
