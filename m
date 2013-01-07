Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsBeU-0001N9-MP
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:18:07 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 655B8D22EA; Mon,  7 Jan 2013 13:02:53 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 00536D22CD;
	Mon,  7 Jan 2013 13:02:18 +0100 (CET)
Message-ID: <50EAB946.5090707@linaro.org>
Date: Mon, 07 Jan 2013 13:02:14 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1354207309-27534-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<50BDC8C3.6060607@linaro.org> <50EA7D0C.5030804@linaro.org>
	<1357559209.25855.0.camel@ted>
In-Reply-To: <1357559209.25855.0.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi: add AArch64 support
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
X-List-Received-Date: Mon, 07 Jan 2013 12:18:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 07.01.2013 12:46, Richard Purdie pisze:

> I thought we'd merged it. It is now merged to master. 

Thanks. One more thing to remove from my layer.



