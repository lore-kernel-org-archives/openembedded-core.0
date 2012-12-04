Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tg1Sc-0000mY-KC
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 23:59:30 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 921DCD22C1; Tue,  4 Dec 2012 23:45:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 69FF2D22B4;
	Tue,  4 Dec 2012 23:44:50 +0100 (CET)
Message-ID: <50BE7CD3.7090706@linaro.org>
Date: Tue, 04 Dec 2012 23:44:35 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1354116375.git.raj.khem@gmail.com>
	<50B6301B.3010106@linaro.org>
	<CAMKF1sr3h8gHmhPbjXa-VfoSfsNsmmWANyNi_Eshp+xcwv5oCw@mail.gmail.com>
	<50BDC045.1030804@linaro.org>
	<CAMKF1sr2xvJDTP4+r+5F_GpE0E=peREQ2OKacfuWDTgpMAn-2A@mail.gmail.com>
In-Reply-To: <CAMKF1sr2xvJDTP4+r+5F_GpE0E=peREQ2OKacfuWDTgpMAn-2A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade binutils to 2.23.1
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
X-List-Received-Date: Tue, 04 Dec 2012 22:59:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 04.12.2012 20:48, Khem Raj pisze:
> can you point out ?
> is it branch issue or some patch that I dropped

There were some updates in binutils trunk from ARM people and we need
those to get gdb trunk running as well. Maybe in January I will have
more time to take a look at it and merge them in 2.23.1 recipe.

So nothing related to your updates.


