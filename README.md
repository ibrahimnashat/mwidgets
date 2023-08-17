## MWidget description

Contains a custom widgets like MText, MDropdown, MFileImage, MNetworkImage, MLottie, MSvg,
MBouncingButton, MRating, MPinPut, MScroll, MTextFiled, MRangeItemWidget, MRadioItemWidget and
others

## Examples

### MText

```dart 
    MText(
        text: product.name,
        size: FoontSize.font18,
        weight: FontWeight.w500,
    ).addPadding(vertical: 12.0),

```

### MSvg

```dart 
    const MSvg(
        name: Svgs.arrowBack,
        height: 32.0,
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

### MLottieImage

```dart 
  MLottieImage(
    name: category.image,
    height: 45.0,
    width: 45.0,
    fit: BoxFit.cover,
  ),
```

### MFileImage

```dart 
  MFileImage(
    file: "",
    height: 45.0,
    width: 45.0,
    fit: BoxFit.cover,
  ),
```

### MAssetImage

```dart 
     MAssetImage(
      name: item.icon,
      width: context.w * 0.85,
      fit: BoxFit.contain,
    );
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

### MTextFiled

```dart 
 MTextFiled(
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
  ).addPadding(bottom: 12.0),
```

### MPasswordWidget and Validates

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

### MProgressButton

```dart 
     MProgressButton(
        progress: 1,
        onTap: () {
          
        },
      ).addPadding(bottom: 21.0),
```

### MSvgButton

```dart 
    MSvgButton(
      width: 60.0,
      height: 60.0,
      icon: Svgs.delete,
      iconSize: 30.0,
      borderRadius: 16.0,
      onTap: () {
      
      },
    ),
```

### MBouncingButton

```dart 
  MBouncingButton(
    title: context.tr.edit,
    onTap: () {
      context.pushReplacement(
        AddNewOrUpdateShipmentScreen(
          moreShipment: moreShipment,
          shipment: shipment,
        ),
      );
    },
  ),
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

### MDividerItemWidget

```dart 

    const MDividerItemWidget(),

```

### MRatingItem

```dart 
  MRatingItem(
    rating: 4.5,
    oneStar: true,
    onRatingUpdate: (value) {},
  ).addPadding(start: 8.0)
```

### MPadding.set()

```dart 
 const Padding(
   padding: MPadding.set(horizontal: 21.0),
   child: MSvg(name: Svgs.date),
 ),
```

### MBorderRadius

```dart 
    borderRadius: MBorderRadius.set(all: 8.0),
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

### Loader

```dart 
     Loader.loadingSkeleton(
       height: context.h * 0.14,
       width: context.w * 0.7,
     ),

     Loader.loadingText(
       height: context.w * 0.04,
       width: context.w * 0.3,
       padding: const MPadding.set(start: 24),
     ),     
```

### ImagesViewerScreen

```dart 
    context.push(
      ImagesViewerScreen(
        urls: images,
        initialImage: initialImage,
      ),
    );   
```

### FToast

```dart 
 FToast.showError(context: context, message: message);
 FToast.showSuccess(context: context, message: message);
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

### showMCupertinoDialog

```dart 
    showCheckMailDialog({required BuildContext context}) {
      showMCupertinoDialog(
        context: context,
        child: const CheckMailDialog(),
      );
    }
```

### PhoneValidator

```dart 
  final phoneValidate = PhoneValidator();
  
  StreamBuilder<bool>(
    initialData: true,
    stream: phoneValidate.validate.stream,
    builder: (context, snapshot) {
      return MTextFiled(
        mKey: const Key('phone'),
        onChanged: (value) {
           phoneValidate.getPhone(phone: value);
        },
        controller: cubit.phone,
        title: context.tr.phoneNumber,
        hintText: '01× ×××× ××××',
        prefix: const MSvg(name: Svgs.phone),
        keyboardType: TextInputType.phone,
        validator: (valid) {
          if (snapshot.data!) {
            return null;
          }
          return context.tr.pleaseEnterValidPhone;
        },
      );
    },
  ).addPadding(bottom: 18.0),
```

### Validates

```dart 
  Validates.isPassword(
    password: cubit.oldPassword.text,
    errorMessage: context.tr.passwordIsShort,
  );
  
  Validates.isConfirmPassword(
    password: cubit.newPassword.text,
    confrimPassword: cubit.confirmPassword.text,
    errorMessage: context.tr.notSamePassword,
  );
  
  Validates.isEmail(
    email: cubit.email.text,
    errorMessage: context.tr.emailIsNotValid,
  );
  
  Validates.isHasData(
    data: cubit.fullName.text,
    errorMessage: context.tr.enterYourName,
  );
```

## Extensions methods

### date format

```dart 
  "".toNameOfMonthAndTime;
  "".toDateOnly;
  "".toDateAndTime;
  "".ago;
  "".toTimeOnly;
  "".toMonthAndDay;
  "".toYearMonthDay;
```

### context

```dart 
 final height = context.mHeight;
 final width = context.mWidth;
 final orientation = context.mOrientation;
 final canPop = context.canPop;
 final maybePop = context.maybePop;
 final tr = context.tr;
 
 context.push(
  ProductDetailsScreen(
    product: item,
  ),
 );
 
 context.pushReplacement(
  ProductDetailsScreen(
    product: item,
  ),
 );
  
 context.pushAndRemoveUntil(
  ProductDetailsScreen(
    product: item,
  ),
 );

 context.pushNamed("/login");  
 
 context.pushReplacementNamed("/login");  
 
 context.pushNamedAndRemoveUntil("/login"); 

 context.pop(); 

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

### kPrint

```dart 
    kPrint("Hello World");

```

#### License

This library is distributed under Apache 2.0 license for more info see [LICENSE DETAILS](./LICENSE)
