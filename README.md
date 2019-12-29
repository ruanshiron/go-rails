# Go Rails

## ruby on rails - HUST - Hệ thống thông tin trên web
### created by

 - Nguyễn Thế Vinh 
 - Phùng Thế Hùng 
 - Bùi Phương Thảo
 - Nguyễn Viết Ngọc Quang
 - Nguyễn Thị Hồng Hạnh
 - Ninh Mạnh Hùng 
### requirement

>  - [x] Cloud Storage `Cloudinary - Carrierwave`
>  - [x] Ajax `Micropost/delte - Relationship - Autocomplete`
>  - [x] Autocomplete `Search - easyAutocomplete`
>  - [x] Dynamic form & Nested Attribute `Miropost.pictures - Cocoon`
>  - [x] SNS Login `Facebook Login`
>  - [x] i18n `en/vi`
>  - [x] Mail `Account Activation Mail - Gmail`
>  - [x] Websocket `Followed Notifications`
>  - [x] Google Map `StaticPages/Contact`
>  - [x] CKeditor `Micropost/new`
>  - [ ] ReactJS/Angular/Vue

### Usage
To get started with the app, clone the repo and then install the needed gems:

  

```

$ bundle install --without production

```

  

Next, migrate the database:

  

```

$ rails db:migrate

```

  
Seed some stuff
```

$ rails db:seed

```

  

If the test suite passes, you'll be ready to run the app in a local server:

  

```

$ rails server

```