# Material_Component_Radio

Material component radio design in OpenHarmony.

## Download & Install

Install using npm

```npm i ohos-material-radio```

Details about OpenHarmony NPM environment configuration, see at [here](https://gitee.com/openharmony-tpc/docs/blob/master/OpenHarmony_npm_usage.md)

## Usage Instructions

1. Import files and code dependencies

```ets
import { RadioButton, RadioGroup, RadioOption, RadioModel }  from '@ohos/material-radio'
```

2. Initialize model data

```
private radioModel: RadioModel = new RadioModel(1, "Radio Label")
```

3. Code for creating radio button

```
RadioButton({
    checked: true,
    model: this.radioModel,
    onCheckChange: (selectedRadioId) => {
        console.log("Selected Radio Button Id:: " + selectedRadioId);
    }
})
```

![Radio_Buttons.png](screenshots/Radio%20Buttons.png)

4. Code for creating radio group

```
RadioGroup(
    {
        selectedRadioId: 1,
        options: [new RadioOption(1, "Option 1"), new RadioOption(2, "Option 2")],
        onCheckChange: (selectedRadioId) => {
            console.log("Selected Radio Button Id:: " + selectedRadioId);
        }
    }
)
```

![Radio_Group.png](screenshots/Radio%20Group.png)

## Compatibility
Supports OpenHarmony API version 8

## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/pulls).

## Open source License
This project is based on [Apache License 2.0](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/blob/main/LICENSE.txt), please enjoy and participate in open source freely.

# Reference:

Design by : Dharma Seelan