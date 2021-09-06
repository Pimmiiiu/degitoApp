### การ deploy app ขึ้น play store 
1. Change Icon and app name

2. Create Keystore

3. Create Key.properties files 
   สร้างใน Key.properties files ใน folder Android 

4. Configure signing in gradle

5. Review the build configuration 
	เช็ค application Id ที่จะเอาขึ้น

6. Build the app for release 
	เปิด file android ใน android studio เปลี่ยน versionName และ versionCode จากนั้นไปที่ build > Generate signed bundle or apk และ เลือก android app bundle และจะได้ file .aab มา และนำไป release ที่ google play console
 	

### การ deploy app ขึ้น app store 
1. Register your Bundle ID
	เอา Bundle ID ใน Xcode มาเพิ่ม Identifiers ในเว็บ apple developer 

2. Create your app in app store connect 
	เปิด app store connect เข้า My app แล้ว add app (ใส่ข้อมูล platform, name, Bundle ID, etc.)

3. Review project setting in Xcode 
	เช็คชื่อ, Bundle ID และ 	version ที่จะเอาขึ้น 

4. Create the build archive 
	เปิด Xcode เลือก device เป็น Any iOS Device แล้วไปที่ product > archive เสร็จแล้วก็รอจน archive runner succeeded แล้วจะมีหน้า archive ขึ้นมา ให้เลือก Runner อันล่าสุด หรืออันที่เราจะ build  แล้ว คลิ้ก validate app พอ validate เสร็จ ก็ คลิ้ก distribute app แล้วเลือก app store connect และ รอจนเสร็จ 

5. Release to the app store 
	ไปที่ app store connect เข้าไป add build หลังจากนั้น save และ submit for review
