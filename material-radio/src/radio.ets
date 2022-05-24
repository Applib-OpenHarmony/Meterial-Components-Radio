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

export class RadioOption {
  id: number
  label: string | Resource
  constructor(id: number, label: string | Resource) {
    this.id = id
    this.label = label
  }
}

@Component
export struct RadioGroup {
  @State options: RadioOption [] = []
  @Link selectedRadioId: number
  private onSelect: ((id: number) => void) = null

  build() {
    Column() {
      List() {
        ForEach(
          this.options,
          (item) => {
            ListItem() {
              RadioButton({
                radioId: item.id,
                radioLabel: item.label,
                selectedRadioId: $selectedRadioId,
                checked: this.selectedRadioId == item.id,
                onSelect: (id) => {
                  if (this.onSelect != null) {
                    this.onSelect(id);
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
  @Prop radioId: number
  @Link selectedRadioId: number
  @State checked: boolean = false
  @State disabled: boolean = false
  @State private rippleVisible: boolean = false
  @State private innerScale: number = 0
  @State private rippleScale: number = 0
  @State private ringOpacity: number = 1
  private radioLabel: string | Resource = ""
  private ringColor: string = "#78A064"
  private onSelect: ((id: number) => void) = null

  aboutToAppear() {
    if (this.disabled) {
      //      this.ringColor = "#757575"
      this.ringOpacity = 0.7
    }
    if (this.checked) {
      this.showInnerRing()
    }
  }

  private onClick() {
    if (this.disabled) return
    if (!this.checked) this.showInnerRing()
    this.startRippleEffect()
  }

  private showInnerRing() {
    this.checked = true
    this.selectedRadioId = this.radioId

    if (this.onSelect != null) {
      this.onSelect(this.radioId);
    }

    animateTo({ duration: 250 }, () => {
      this.innerScale = 1
    })
  }

  private hideInnerRing() {
    animateTo({ duration: 250 }, () => {
      this.checked = false
      this.innerScale = 0
    })
  }

  private startRippleEffect() {
    this.rippleVisible = true
    animateTo({
      duration: 500,
      onFinish: () => {
        this.rippleScale = 0
        this.rippleVisible = false
      }
    }, () => {
      this.rippleScale = 2.4
    })
  }

  build() {
    Column() {
      Row() {
        Stack() {
          Stack() {
            Circle({ width: '16vp', height: '16vp' })
              .borderRadius('8vp')
              .opacity(this.ringOpacity)
              .fill(this.checked ? this.ringColor : Color.White)
              .scale({ x: this.innerScale, y: this.innerScale })

            Circle({ width: '16vp', height: '16vp' })
              .opacity(.2)
              .borderRadius('8vp')
              .fill(this.ringColor)
              .scale({ x: this.rippleScale, y: this.rippleScale })
              .visibility(this.rippleVisible ? Visibility.Visible : Visibility.Hidden)
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
        .opacity(this.ringOpacity)
        .backgroundColor(this.ringColor)

        Text(this.radioLabel)
          .fontSize('16vp')
          .margin({ left: '8vp', right: '16vp' })
      }.width('100%')
    }
    .onClick(() => this.onClick())
    .margin(8)
    .padding(4)
  }
}