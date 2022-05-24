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
import { RadioButton, RadioOption, RadioGroup }  from '@ohos/material-radio'

@Entry
@Component
struct Index {
  @State singleSelectedRadioId: number = -1
  @State selectedRadioId: number = -1
  private radioOptions: RadioOption [] = [
    new RadioOption(1, $r('app.string.option_1')),
    new RadioOption(2, $r('app.string.option_2')),
    new RadioOption(3, $r('app.string.option_3'))
  ]

  build() {
    Column() {

      Text($r('app.string.radio_buttons'))
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioButton({
        radioId: 1,
        radioLabel: $r('app.string.radio_enabled'),
        selectedRadioId: $singleSelectedRadioId,
        onSelect: (id) => {
          prompt.showToast({
            message: id.toString()
          })
        }
      })

      RadioButton({
        radioId: 2,
        radioLabel: $r('app.string.radio_disabled'),
        selectedRadioId: $singleSelectedRadioId,
        disabled: true
      })

      RadioButton({
        radioId: 3,
        radioLabel: $r('app.string.radio_selected_enabled'),
        selectedRadioId: $singleSelectedRadioId,
        checked: true
      })

      RadioButton({
        radioId: 4,
        radioLabel: $r('app.string.radio_selected_disabled'),
        selectedRadioId: $singleSelectedRadioId,
        checked: true,
        disabled: true
      })

      Divider().height(4)

      Text($r('app.string.radio_group'))
        .width('100%')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .margin({ left: 20, top: 8 })

      RadioGroup({
        options: this.radioOptions,
        selectedRadioId: $selectedRadioId,
        onSelect: (id) => {
          prompt.showToast({
            message: "Selected radio button id - " + id
          });
        }
      })

    }
    .width('100%')
  }
}