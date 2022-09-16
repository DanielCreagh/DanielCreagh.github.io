# Button Shapes

Button shapes are part of the iOS accessibility system. They can be enabled by: -
1. open settings app in iOS
2. navigate to `Accessibility`
3. navigate to `Display & Text Size`
4. enable `Button Shapes`

![1_settings_accessibility](/images/Accessibility-Button-Shapes/1_settings_accessibility.png)
![2_settings_display-&-text-size](/images/Accessibility-Button-Shapes/2_settings_display-&-text-size.png)
![3_settings_button-shapes](/images/Accessibility-Button-Shapes/3_settings_button-shapes.png)

Two things are now enabled throughout the OS and also in individual apps that use iOS components.
- underlines on navigation bar text and other tappable text (making them more like hyper links)
- translucent boxes around button areas

The purpose of these is to make it a bit more clear which items are selected and tappable and to give some more clues as to the behaviour of the items.

---

## Contrast tool
Another important aspect of accessibility is the contrast of colours within the UI components. 

[This](https://webaim.org/resources/contrastchecker/) tool can be used to check the colour contrasts meet this particuar standard.

### Pass
![pass contrast test](/images/Accessibility-Button-Shapes/contrast-test-pass.png)

### Fail
![fail contrast test](/images/Accessibility-Button-Shapes/contrast-test-fail.png)

You can use something like Digital Colour Meter in MacOS to extract the RGB values to plug into the contrast test tool.

---

# Testing
I couldn't find a way of enabling and disabling `buttonShapes` from within XCTestCase. 

Hopefully [this](https://stackoverflow.com/questions/73746279/how-can-accessibility-settings-be-configured-from-inside-an-xctestcase) will shine some light on this problem.