# template

## Structure

|       | _core      |
|-------|------------|
| Model | Datasource |
|       | Repo       |
|       | View       |

|            |      |
|------------|------|
| gen        | View |
| i10n       |      |
| resource   |      |
| service    |      |
| util       |      |
| widget     |      |
| middleware |      |

## Multi lang 

To update, go to [i10n](https://docs.google.com/spreadsheets/d/11zbFPrVgWH-sNKUR0VYKV2FwfaXPi2J2B07tlwcsjjg)

Update version of `locale_keys.dart`, run
```
flutter pub run build_runner build --delete-conflicting-outputs
```

Don't forget to revert version of `locale_keys.dart`

_To generate `Assets`, run line above too when assets folder has new update_

## Run test coverage

```
flutter test --coverage
genhtml -o coverage coverage/lcov.info
open coverage/index.html
```
