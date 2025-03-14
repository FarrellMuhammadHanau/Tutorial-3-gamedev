# Tutorial 3
Pada tutorial ini, saya mengimplementasikan serta mempolish beberapa fitur: <br>
	1. Double jump <br>
	2. Dashing (double click left/right arrow) yang disertai spritenya <br>
	3. Crouching (down arrow) yang akan mengecilkan colission box serta memiliki spritenya sendiri <br>
	4. Sprite mengikuti arah jalan <br>
	5. Sprite sendiri ketika diudara atau tidak menyentuh lantai <br>
<br><br>
Proses pengerjaan: <br>
	1. Mengubah gravitasi dan jump_speed menjadi lebih cepat <br>
	2. Menambahkan mekanisme double jump saat menekan tombol arrow_up <br>
	3. Menambahkan fitur crouch saat menekan tombol arrow_down <br>
	4. Menambahkan mekanisme "keep crouching" ketika crouch kedalam ruangan sempit. Caranya dengan menggunakan [test move](https://forum.godotengine.org/t/using-test-move/27195/2). <br>
	5. Membuat deteksi double click dengan memanfaatkan [is_action_just_pressed](https://docs.godotengine.org/en/stable/classes/class_input.html#class-input-method-is-action-just-pressed) dan timer. <br>
	6. Menambahkan mekanisme dash ketika double melakukan double click <br>
	7. Menambahkan perubahan sprite dengan membagi region sprite dan menggunakan [$](https://forum.godotengine.org/t/what-does-sign-mean/17190/2) untuk mengakses child node Sprite dan ColissionBox2D untuk mengubahnya. <br>
	8. Mengubah sprite sesuai dengan arah jalan dengan melakukan [flip](https://forum.godotengine.org/t/flipping-sprite-around/40427) <br>
<br><br>
Referensi: <br>
	1. https://forum.godotengine.org/t/using-test-move/27195/2 <br>
	2. https://docs.godotengine.org/en/stable/classes/class_input.html#class-input-method-is-action-just-pressed <br>
	3. https://forum.godotengine.org/t/what-does-sign-mean/17190/2 <br>
	4. https://forum.godotengine.org/t/flipping-sprite-around/40427 <br>

# Tutorial 5
