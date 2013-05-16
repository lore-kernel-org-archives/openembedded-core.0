Received: from outbound2.exchangedefender.com ([65.99.255.238])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <g.sikorski@camlintechnologies.com>)
	id 1Ud0jm-0008M7-IK for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 18:09:07 +0200
Received: from kelvatek.com (78-33-179-130.static.enta.net [78.33.179.130]
	(may be forged))
	by outbound2.exchangedefender.com (8.13.8/8.13.8) with ESMTP id
	r4GFgJFR013192 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 11:42:24 -0400
Received: from [192.168.42.148] ([192.168.42.148]) by kelvatek.com with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 16 May 2013 16:42:19 +0100
Message-ID: <5194FE5B.4060902@kelvatek.com>
Date: Thu, 16 May 2013 16:42:19 +0100
From: Grzegorz Sikorski <g.sikorski@kelvatek.com>
Organization: Kelvatek
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-OriginalArrivalTime: 16 May 2013 15:42:19.0665 (UTC)
	FILETIME=[F3347810:01CE524B]
X-ExchangeDefender-Info: Please contact the ISP for more information
X-MailScanner-ID: r4GFgJFR013192
X-ExchangeDefender-VirusScan: Found to be clean
X-ExchangeDefender-From: g.sikorski@camlintechnologies.com
X-ExchangeDefender-MagicKey: 1369928546.88463@PaXpowExKqkchLR/Kuvc1g
X-Spam-Status: No
Subject: Issue with ti81xx-psp-linux-2.6.37 & gcc-4.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 16:09:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I was trying to update my AM3874-custom board OE (Angstrom) system to 
the new version, base on gcc-4.7 and got stuck on 
https://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html. 
The thread is very old and still unresolved. Does anyone know if there 
exists workaround or kernel patch from TI on this topic?

Best regards,
Greg

--
Asylia ExchangeDefender Message Security: Click below to verify authenticity
http://www.exchangedefender.com/verify.asp?id=r4GFgJFR013192&from=g.sikorski@camlintechnologies.com




