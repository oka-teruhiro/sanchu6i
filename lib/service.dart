// ファイアーストアと通信するクラス
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {

  final db = FirebaseFirestore.instance;

  Future<void> crate() async {

    await db.collection('songs').doc('S01').set(
        {
          'title': 'Pokar Face',
          'artist': 'レディー・ガガ',
          'released': 2008,
          'genre': 'エレクトロ・ポップ',
        }
    );

    await db.collection('songs').doc('S02').set(
      {
        'title': '米津玄師',
        'artist': 'Lemon',
        'released': 2018,
        'genre': 'J-POP',
      },
    );
    await db.collection('songs').doc('S03').set(
      {
        'title': 'クリスマス・イブ',
        'artist': '山下達郎',
        'released': 1983,
        'genre': 'J-POP',
      },
    );
    await db.collection('songs').doc('S04').set(
      {
        'title': 'Shape of you',
        'artist': 'エド シーラン',
        'released': 2017,
        'genre': 'トロピカルハウス',
      },
    );
    await db.collection('songs').doc('S05').set(
      {
        'title': 'Wonderwall',
        'artist': 'オアシス',
        'released': 1995,
        'genre': 'ブリットポップ',
      },
    );
    await db.collection('songs').doc('S06').set(
      {
        'title': 'ブルーバード',
        'artist': 'いきものがかり',
        'released': 2008,
        'genre': 'J-POP',
      },
    );
    await db.collection('songs').doc('S07').set(
      {
        'title': 'Beat it',
        'artist': 'マイケル ジャクソン',
        'released': 1983,
        'genre': 'ハードロック',
      },
    );
    await db.collection('songs').doc('S08').set(
      {
        'title': 'STAY',
        'artist': 'ザ キッド ラロイ',
        'released': 2021,
        'genre': 'ポップラップ',
      },
    );
    await db.collection('songs').doc('S09').set(
      {
        'title': 'チェリー',
        'artist': 'スピッツ',
        'released': 1996,
        'genre': 'J-POP',
      },
    );
    await db.collection('songs').doc('S10').set(
      {
        'title': 'ミックスナッツ',
        'artist': 'Official髭男dism',
        'released': 2022,
        'genre': 'J-POP',
      },
    );
  }



  Future<void> read() async {
    final doc = await db.collection('songs').doc('S04').get();
    final song = doc.data().toString();
    debugPrint(song);
  }

  Future<void> update() async {
    await db.collection('songs').doc('S09').update(
      {
        'genre': 'ロック',
      }
    );
  }

  Future<void> delete() async {
    await db.collection('songs').doc('S02').delete();
  }
}