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

export class RadioModel {
  private radioId: number = undefined
  private radioLabel: string | Resource = undefined

  private disabled: boolean = false

  private innerScale: number = 0
  private ringOpacity: number = 1
  private ringColor: string | Color = "#78A064"

  private rippleScale: number = 0
  private rippleVisible: boolean = false

  constructor(id: number, label: string | Resource) {
    this.radioId = id
    this.radioLabel = label
  }

  buildUI(): boolean {
    return (this.radioId != null && this.radioId != -1) &&
    (this.radioLabel != null && this.radioLabel != "")
  }

  getRadioId(): number {
    return this.radioId
  }

  getRadioLabel(): string | Resource {
    return this.radioLabel
  }

  isDisabled(): boolean {
    return this.disabled
  }

  setDisabled(bool: boolean): RadioModel {
    this.disabled = bool != null ? bool : false;
    return this
  }

  getInnerScale(): number {
    return this.innerScale
  }

  setInnerScale(scale: number): RadioModel {
    if (scale != null && scale <= 1) {
      this.innerScale = scale;
    } else {
      this.innerScale = 0;
    }
    return this
  }

  getRingOpacity(): number {
    return this.ringOpacity
  }

  setRingOpacity(opacity: number): RadioModel {
    if (opacity != null && (opacity > 0.5 && opacity <= 1)) {
      this.ringOpacity = opacity;
    } else {
      this.ringOpacity = 1;
    }
    return this
  }

  getRingColor(): string | Color {
    return this.ringColor
  }

  setRingColor(color: string | Color): RadioModel {
    this.ringColor = color != null ? color : "#78A064";
    return this
  }

  getRippleScale(): number {
    return this.rippleScale
  }

  setRippleScale(scale: number): RadioModel {
    if (scale != null && (scale > 0 && scale <= 2.4)) {
      this.rippleScale = scale;
    } else {
      this.rippleScale = 0;
    }
    return this
  }

  getRippleVisible(): boolean {
    return this.rippleVisible
  }

  setRippleVisible(bool: boolean): RadioModel {
    this.rippleVisible = bool != null ? bool : false;
    return this
  }

  reset(): RadioModel {
    this.disabled = false
    this.innerScale = 0
    this.ringOpacity = 1
    this.ringColor = "#78A064"
    this.rippleScale = 0
    this.rippleVisible = false
    return this
  }
}