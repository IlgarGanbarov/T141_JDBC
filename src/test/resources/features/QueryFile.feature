
Feature: Select Query Execution

  Background: Database baglantisi kurar
    * Database connection kurar.

  @Query01
  Scenario:  Deposits tablosunda amount degerine gore id sorgulama testi.

    * Query01 hazirlar
    * Query01 sonuclarini isler
    * Database baglantisini kapatir.

  @Query02
  Scenario: "cron_schedules" tablosundaki ilk 2 kaydın "name" bilgisini doğrulama testi.

    * Query02 hazirlar.
    * Query02 sonuclarini isler.
    * Database baglantisini kapatir.

  @Query03
  Scenario: email adresinden kullanici ismi sorgulama testi.

    * Database connection kurar.
    * Query03 hazirlar.
    * Query03 sonuclarini isler.
    * Database connection kapatir.