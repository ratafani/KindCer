//
//  SymptompsModel.swift
//  KindCer2.0
//
//  Created by Mauldy Putra on 13/11/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import Foundation

enum SymptompsType{
    case alergi
    case bengkak
    case diare
    case demam
    case gatal
    case lemas
    case matiRasa
    case mulut
    case muntah
    case mual
    case sembelit
    case otot
    case nafas
    case makan
    case telan
    case lainnya
}

class SymptompModel {
    var aman = ""
    var ringan = ""
    var sedang = ""
    var parah = ""
    
    init(type: SymptompsType) {
        switch type {
        case .alergi:
            question(aman: "", ringan: "bintil-bintil merah pada kulit, tidak demam", sedang: "bintil-bintil merah pada kulit, demam < 38°C", parah: "Gatal - gatal, demam lebih 38°C")
        case .bengkak:
            question(aman: "", ringan: "Bengkak di tangan atau kaki", sedang: "Bengkak di bagian atas lengan atau kaki", parah: "Bengkak sampai sakit atau susah bernafas")
        case .diare:
            question(aman: "", ringan: "Tinja berpencar", sedang: "Tinja berair, lebih banyak dari biasanya", parah: "berdarah, atau sampai membuat pusing")
        case .demam:
            question(aman: "Suhu badan 37°C", ringan: "Suhu badan 37°C - 38°C", sedang: "Suhu badan 37°C - 40°C", parah: "Suhu badan > 40°C")
        case .gatal:
            question(aman: "", ringan: "Ruam kulit tersebar dengan kemerahan / gatal ringan", sedang: "Ruam dengan luka", parah: "Ruam dengan luka terbuka")
        case .lemas:
            question(aman: "", ringan: "Bisa melakukan aktivitas tetapi dengan usaha yang lebih", sedang: "Di tempat tidur kurang dari setengah hari", parah: "Di tempat tidur lebih dari setengah hari")
        case .matiRasa:
            question(aman: "", ringan: "Merasakan kesemutan", sedang: "Kesemutan sampai mati rasa", parah: "Mati rasa sampai mengganggu aktivitas")
        case .mulut:
            question(aman: "", ringan: "Bisul yang tidak sakit", sedang: "Bisul yang sakit tetapi masih bisa makan ", parah: "Bisul yang sakit sampai tidak bisa makan")
        case .muntah:
            question(aman: "", ringan: "Muntah sekali sehari", sedang: "Muntah 2-5 kali sehari", parah: "Muntah > 6 kali sehari")
        case .mual:
            question(aman: "", ringan: "Masih bisa makan / minum", sedang: "Makan / minum kurang dari biasanya", parah: "Tidak bisa makan / minum")
        case .sembelit:
            question(aman: "", ringan: "Tidak buang air besar selama 2 hari", sedang: "Tidak buang air besar selama 3 - 4 hari", parah: "Tidak buang air besar selama 6 hari lebih atau perut bengkak")
        case .otot:
            question(aman: "", ringan: "Nyeri tapi tidak butuh obat", sedang: "Butuh obat untuk rasa sakit", parah: "Obat tidak menyembuhkan")
        case .nafas:
            question(aman: "", ringan: "Membutuhkan usaha", sedang: "Membutuhkan usaha di aktivitas biasa", parah: "pada saat tidur")
        case .makan:
            question(aman: "", ringan: "Nafsu makan berkurang", sedang: "Tidak merasa lapar", parah: "Apapun tidak terasa enak / tidak bisa makan sesuatu")
        case .telan:
            question(aman: "", ringan: "Terasa sakit tetapi masih bisa makan", sedang: "Terasa sakit dan perlu dukungan cairan agar bisa menelan", parah: "Tidak bisa makan sama sekali")
        case .lainnya:
            question(aman: "", ringan: "", sedang: "", parah: "")
        }
    }
    
    init(type: String) {
        switch type {
        case "Alergi":
            question(aman: "", ringan: "bintil-bintil merah pada kulit, tidak demam", sedang: "bintil-bintil merah pada kulit, demam < 38°C", parah: "Gatal - gatal, demam lebih 38°C")
        case "Bengkak":
            question(aman: "", ringan: "Bengkak di tangan atau kaki", sedang: "Bengkak di bagian atas lengan atau kaki", parah: "Bengkak sampai sakit atau susah bernafas")
        case "Diare":
            question(aman: "", ringan: "Tinja berpencar", sedang: "Tinja berair, lebih banyak dari biasanya", parah: "berdarah, atau sampai membuat pusing")
        case "Demam":
            question(aman: "Suhu badan 37°C", ringan: "Suhu badan 37°C - 38°C", sedang: "Suhu badan 37°C - 40°C", parah: "Suhu badan > 40°C")
        case "Gatal / iritasi":
            question(aman: "", ringan: "Ruam kulit tersebar dengan kemerahan / gatal ringan", sedang: "Ruam dengan luka", parah: "Ruam dengan luka terbuka")
        case "Lemas":
            question(aman: "", ringan: "Bisa melakukan aktivitas tetapi dengan usaha yang lebih", sedang: "Di tempat tidur kurang dari setengah hari", parah: "Di tempat tidur lebih dari setengah hari")
        case "Mati Rasa / Kesemutan":
            question(aman: "", ringan: "Merasakan kesemutan", sedang: "Kesemutan sampai mati rasa", parah: "Mati rasa sampai mengganggu aktivitas")
        case "Mulut":
            question(aman: "", ringan: "Bisul yang tidak sakit", sedang: "Bisul yang sakit tetapi masih bisa makan ", parah: "Bisul yang sakit sampai tidak bisa makan")
        case "Muntah":
            question(aman: "", ringan: "Muntah sekali sehari", sedang: "Muntah 2-5 kali sehari", parah: "Muntah > 6 kali sehari")
        case "Mual / Enek":
            question(aman: "", ringan: "Masih bisa makan / minum", sedang: "Makan / minum kurang dari biasanya", parah: "Tidak bisa makan / minum")
        case "Buang Air Besar":
            question(aman: "", ringan: "Tidak buang air besar selama 2 hari", sedang: "Tidak buang air besar selama 3 - 4 hari", parah: "Tidak buang air besar selama 6 hari lebih atau perut bengkak")
        case "Otot / Persendian":
            question(aman: "", ringan: "Nyeri tapi tidak butuh obat", sedang: "Butuh obat untuk rasa sakit", parah: "Obat tidak menyembuhkan")
        case "Bernafas":
            question(aman: "", ringan: "Membutuhkan usaha", sedang: "Membutuhkan usaha di aktivitas biasa", parah: "pada saat tidur")
        case "Nafsu Makan":
            question(aman: "", ringan: "Nafsu makan berkurang", sedang: "Tidak merasa lapar", parah: "Apapun tidak terasa enak / tidak bisa makan sesuatu")
        case "Susah Menelan":
            question(aman: "", ringan: "Terasa sakit tetapi masih bisa makan", sedang: "Terasa sakit dan perlu dukungan cairan agar bisa menelan", parah: "Tidak bisa makan sama sekali")
        case "Lainnya":
            question(aman: "", ringan: "", sedang: "", parah: "")
        default:
            question(aman: "", ringan: "", sedang: "", parah: "")
        }
    }
    
    func question(aman: String, ringan: String, sedang: String, parah: String){
        self.aman = aman
        self.ringan = ringan
        self.sedang = sedang
        self.parah = parah
    }
}


