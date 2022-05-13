# Material_Component_Radio

Material component radio design in OpenHarmony.

## Download & Install

Install using npm

```npm i radio```

Details about OpenHarmony NPM environment configuration, see at [here](https://gitee.com/openharmony-tpc/docs/blob/master/OpenHarmony_npm_usage.md)

## Usage Instructions

Import all components at once

```ets
import { RadioButton, RadioOption, RadioGroup }  from 'radio'
```

Use respective components to create below radio button/group design.

## Radio Button Design: 

RadioButton(
    {
        radioId: 1,
        radioLabel: 'Radio Button',
        selectedRadioId: $selectedRadioId,
        checked: false,
        disabled: false
    }
)

## Radio Group Design: 

RadioGroup(
    {
        options: [new RadioOption(1, "Option 1"), new RadioOption(2, "Option 2")],
        selectedRadioId: $selectedRadioId
    }
)


## Compatibility
Supports OpenHarmony API version 8

## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/pulls).

## Open source License
This project is based on [Apache License 2.0](https://github.com/Applib-OpenHarmony/Meterial-Components-Radio/blob/main/LICENSE.txt), please enjoy and participate in open source freely.

# Reference:

Design by : Dharma Seelan

[comment]: <> (<a href="sample_images/design.png">Original Design Mockup</a>)