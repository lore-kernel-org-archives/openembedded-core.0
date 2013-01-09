Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsxMy-0004Sb-6n
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 16:15:08 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D51BAD22E9; Wed,  9 Jan 2013 15:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BE8B8D22CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2013 15:59:36 +0100 (CET)
Message-ID: <50ED85D4.9000806@linaro.org>
Date: Wed, 09 Jan 2013 15:59:32 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1357343832.git.raj.khem@gmail.com>
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Wed, 09 Jan 2013 15:15:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.01.2013 01:00, Khem Raj pisze:
> I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
> booted on all supported qemu images.
> 
> This is however now the final set since I have to put the 2.17 tars on
> downloads location
> 
> Please try it out in your configurations and let me know if you find issues.

Other than meta-toolchain I did not found any new bugs while built for
AArch64 target.


