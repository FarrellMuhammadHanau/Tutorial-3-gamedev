Pada tutorial ini, saya mengimplementasikan serta mempolish beberapa fitur:
	1. Double jump
	2. Dashing (double click left/right arrow) yang disertai spritenya
	3. Crouching (down arrow) yang akan mengecilkan colission box serta memiliki spritenya sendiri
	4. Sprite mengikuti arah jalan
	5. Sprite sendiri ketika diudara atau tidak menyentuh lantai

Proses pengerjaan:
	1. Mengubah gravitasi dan jump_speed menjadi lebih cepat
	2. Menambahkan mekanisme double jump saat menekan tombol arrow_up
	3. Menambahkan fitur crouch saat menekan tombol arrow_down
	4. Menambahkan mekanisme "keep crouching" ketika crouch kedalam ruangan sempit. Caranya dengan menggunakan [test move](https://forum.godotengine.org/t/using-test-move/27195/2).
	5. Membuat deteksi double click dengan memanfaatkan [is_action_just_pressed](https://docs.godotengine.org/en/stable/classes/class_input.html#class-input-method-is-action-just-pressed) dan timer.
	6. Menambahkan mekanisme dash ketika double melakukan double click
	7. Menambahkan perubahan sprite dengan membagi region sprite dan menggunakan [$](https://forum.godotengine.org/t/what-does-sign-mean/17190/2) untuk mengakses child node Sprite dan ColissionBox2D untuk mengubahnya.
	8. Mengubah sprite sesuai dengan arah jalan dengan melakukan [flip](https://forum.godotengine.org/t/flipping-sprite-around/40427) 

Referensi:
	1. https://forum.godotengine.org/t/using-test-move/27195/2
	2. https://docs.godotengine.org/en/stable/classes/class_input.html#class-input-method-is-action-just-pressed
	3. https://forum.godotengine.org/t/what-does-sign-mean/17190/2
	4. https://forum.godotengine.org/t/flipping-sprite-around/40427
