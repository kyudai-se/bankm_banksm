module Kana
# 全角を半角に変換
  def self.zen2han(str)
    return if str.nil?
    han = str.tr("Ａ-Ｚａ-ｚ０-９", "A-Za-z0-9")
    han.tr!('＆％（）！　．，＋－ー&#8212;', '&%()! .,+-')

    dakuon     = 'ガギグゲゴザジズゼゾダヂヅデドバビブベボヴ'
    daku_clear = 'カキクケコサシスセソタチツテトハヒフヘホウ'
    handakuon     = 'パピプペポ'
    handaku_clear = 'ハヒフヘホ'
    han.gsub!(/[#{dakuon}]/) {|c| c + 'ﾞ'}
    han.gsub!(/[#{handakuon}]/) {|c| c + 'ﾟ'}
    han.tr!(dakuon + handakuon, daku_clear + handaku_clear)

    zenkaku = '。「」、・ァィゥェォャュョッーアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン゛゜ヵヶヰヱヮ'
    hankaku = '｡｢｣､.ｧｨｩｪｫｬｭｮｯｰｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝﾞﾟｶｹｲｴﾜ'
    han.tr(zenkaku, hankaku) || han
  end

# ひらがなを含めて、全角を半角に変換
  def self.hira2han(str)
    return if str.nil?
    zen2han(str.tr('あ-ん','ア-ン'))
  end

# 全角を全銀フォーマットで利用可能な半角に変換
  def self.zen2eb(str)
    return if str.nil?
    zen2han(str).upcase.tr('ｧｨｩｪｫｬｭｮｯ_','ｱｲｳｴｵﾔﾕﾖﾂ-')
  end

# ひらがなを含めて、全角を全銀フォーマットで利用可能な半角に変換
  def self.hira2eb(str)
    return if str.nil?
    zen2eb(str.tr('あ-ん','ア-ン'))
  end
end
