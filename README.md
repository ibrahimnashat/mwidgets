## MWidget description

Contains a custom widgets like MText, MDropdown, MFileImage, MNetworkImage, MLottie, MSvg,
MBouncingButton, MRating, MPinPut, MScroll, MTextFiled, MRangeItemWidget, MRadioItemWidget and
others

## Examples

### MText

```dart 
  MText(
      text: category.name,
      size: FoontSize.font16,
      weight: FontWeight.w500,
  )
```

### MNetworkImage

```dart 
  MNetworkImage(
    url: category.image,
    height: 45.0,
    width: 45.0,
    fit: BoxFit.cover,
  ),
```

### showMBottomSheet

```dart 
    showReviewsBottomSheet({
      required BuildContext context,
      required String productId,
    }) {
      showMBottomSheet(
        context: context,
        noScrolling: true,
        bottomSheet: ReviewsBottomSheet(productId: productId),
      );
    }

```

### MScroll

```dart 
    return MScroll(
      axis: Axis.horizontal,
      child: Row(
        children: cubit.products.map((item) {
          return ProductItemWidget(
            product: item,
          );
        }).toList(),
      ),
    );
```

### MSvg

```dart 
    const MSvg(
        name: Svgs.arrowBack,
        height: 32.0,
    )

```

### .addAction()

```dart 
    MSvg(
      height: 26.0,
      name: Svgs.saved ,
      color: Coolors.grey,
    ).addAction(
      onGesture: () {
      },
    );

```

### MText

```dart 
    MText(
        text: product.name,
        size: FoontSize.font18,
        weight: FontWeight.w500,
    ).addPadding(vertical: 12.0),

```

### MDividerItemWidget

```dart 

    const MDividerItemWidget(),

```

### MAnimatedButton

```dart 
  MAnimatedButton(
  onTap: () async {
    await cubit.addToCart(productId: product.id);
  },
  title: context.tr.addToCart,
  success: Row(
    children: [
      const MSvg(
        name: Svgs.cartDone,
        height: 28.0,
        color: Coolors.greenAccent,
      ).addPadding(end: 12.0),
      MText(
        text: context.tr.done,
        size: FoontSize.font18,
        color: Coolors.greenAccent,
      )
    ],
  ),
);
```

### context.push()

```dart 
 RecentSearchItemWidget(
     product: item,
     onTap: () {
        context.push(
          ProductDetailsScreen(
            product: item,
          ),
        );
      },
 );

```

### MPadding.set()

```dart 
 const Padding(
   padding: MPadding.set(horizontal: 21.0),
   child: MSvg(name: Svgs.date),
 ),
```

### MPinput

```dart 
  MPinput(
      mKey: const Key('pinPut'),
      length: 6,
      onChanged: verifyCubit.setCode,
      keyboardType: TextInputType.number,
    ).addPadding(bottom: 24.0),
```

### MRatingItem

```dart 
  MRatingItem(
    rating: 4.5,
    oneStar: true,
    onRatingUpdate: (value) {},
  ).addPadding(start: 8.0)
```

### showMCupertinoDialog

```dart 
    showCheckMailDialog({required BuildContext context}) {
      showMCupertinoDialog(
        context: context,
        child: const CheckMailDialog(),
      );
    }
```

### FToast

```dart 
 FToast.showError(context: context, message: message);
 FToast.showSuccess(context: context, message: message);
```

### MPasswordWidget, MTextFiled, and Validates

```dart 
 MPasswordWidget(
    child: (icon, hide) {
      kPrint(hide);
      return MTextFiled(
        controller: cubit.password,
        obscureText: hide,
        paddingVertical: 8.0,
        suffix: icon,
        hintText: context.tr.password,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Coolors.highLight),
          borderRadius: BorderRadius.circular(5.0),
        ),
        validator: (valid) {
          return Validates.isPassword(
            password: cubit.password.text,
            errorMessage: context.tr.passwordIsShort,
          );
        },
      );
    },
    ).addPadding(bottom: 12.0),
```

### MDropDown

```dart 
  MDropDown<CategoryModel>(
    inFill: false,
    options: cubit.categories,
    setInitial: cubit.category,
    title: context.tr.chooseCategory,
    hint: context.tr.chooseCategory,
    itemTitle: (item) => item.name,
    onChanged: cubit.setCategory,
  ).addPadding(bottom: 20.0),
```

### MBorderRadius

```dart 
    borderRadius: MBorderRadius.set(all: 8.0),
```

#### License

This library is distributed under Apache 2.0 license for more info see [LICENSE DETAILS](./LICENSE)
