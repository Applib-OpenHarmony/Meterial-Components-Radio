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

import prompt from '@system.prompt';
import { RadioButton, RadioGroup, RadioOption, RadioModel }  from '@ohos/material-radio'

@Entry
@Component
struct Index {
  private radioModel1: RadioModel = new RadioModel(1, $r('app.string.radio_enabled'))
  private radioModel2: RadioModel = new RadioModel(2, $r('app.string.radio_disabled'))
  private radioModel3: RadioModel = new RadioModel(3, $r('app.string.radio_selected_enabled'))
  private radioModel4: RadioModel = new RadioModel(4, $r('app.string.radio_selected_disabled'))
  private radioOptions: RadioOption [] = [
    new RadioOption(1, $r('app.string.option_1')),
    new RadioOption(2, $r('app.string.option_2')),
    new RadioOption(3, $r('app.string.option_3'))
  ]

  aboutToAppear() {
    this.radioModel2.setDisabled(true);
    this.radioModel4.setDisabled(true);
  }

  private onRadioCheck(id: number) {
    prompt.showToast({
      message: id.toString()
    })
  }

  private onRadioGroupCheck(id: number) {
    prompt.showToast({
      message: "Selected radio button id - " + id
    })
  }

  build() {
    Column() {

      Text($r('app.string.radio_buttons'))
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioButton({
        model: this.radioModel1,
        onCheckChange: this.onRadioCheck
      })

      RadioButton({
        model: this.radioModel2,
        onCheckChange: this.onRadioCheck
      })

      RadioButton({
        model: this.radioModel3,
        checked: true,
        onCheckChange: this.onRadioCheck
      })

      RadioButton({
        model: this.radioModel4,
        checked: true,
        onCheckChange: this.onRadioCheck
      })

      Divider().height(4)

      Text($r('app.string.radio_group'))
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioGroup({
        options: this.radioOptions,
        onCheckChange: this.onRadioGroupCheck
      })

    }
    .width('100%')
  }
}