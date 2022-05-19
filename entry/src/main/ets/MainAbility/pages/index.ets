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

import { RadioButton, RadioOption, RadioGroup }  from '@ohos/material-radio'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State singleSelectedRadioId: number = -1
  @State selectedRadioId: number = -1
  private radioOptions: RadioOption [] = [
    new RadioOption(1, "Option 1"),
    new RadioOption(2, "Option 2"),
    new RadioOption(3, "Option 3")
  ]

  build() {
    Column() {

      Text("Radio Buttons")
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioButton({
        radioId: 1,
        radioLabel: 'Radio Enabled',
        selectedRadioId: $singleSelectedRadioId
      })

      RadioButton({
        radioId: 1,
        radioLabel: 'Radio Disabled',
        selectedRadioId: $singleSelectedRadioId,
        disabled: true
      })

      RadioButton({
        radioId: 1,
        radioLabel: 'Radio Selected Enabled',
        selectedRadioId: $singleSelectedRadioId,
        checked: true
      })

      RadioButton({
        radioId: 1,
        radioLabel: 'Radio Selected Disabled',
        selectedRadioId: $singleSelectedRadioId,
        checked: true,
        disabled: true
      })

      Divider().height(4)

      Text("Radio Group")
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioGroup({
        options: this.radioOptions,
        selectedRadioId: $selectedRadioId
      })

    }
    .width('100%')
  }
}