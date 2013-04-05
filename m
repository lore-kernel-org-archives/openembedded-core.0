Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UO3fG-0007kR-Q1
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 12:14:36 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D159FD22E9; Fri,  5 Apr 2013 11:57:29 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5B31CD20D2;
	Fri,  5 Apr 2013 11:57:06 +0200 (CEST)
Message-ID: <515E9FE9.1070906@linaro.org>
Date: Fri, 05 Apr 2013 11:56:57 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <515E976C.8060302@linaro.org> <1365155658.6526.136.camel@ted>
In-Reply-To: <1365155658.6526.136.camel@ted>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 10:14:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.04.2013 11:54, Richard Purdie pisze:
> This means that virtual/libc is providing something which the external
> toolchain recipes are not. Can you share the "bitbake -DDDv" output for
> the above command somewhere (I know there will be a lot of it). Buried
> somewhere in there will be the answer as it does tell you what is going
> on if you search for the right things.

http://tygrysek.juszkiewicz.com.pl/~hrw/tmp/rp-log.txt 3.4MB


