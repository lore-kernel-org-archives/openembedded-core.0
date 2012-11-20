Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tai5k-0007Dx-MA
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 08:17:58 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D1DFDD22CD; Tue, 20 Nov 2012 08:04:02 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id EE0C8D224F;
	Tue, 20 Nov 2012 08:03:31 +0100 (CET)
Message-ID: <50AB2B39.4030707@linaro.org>
Date: Tue, 20 Nov 2012 08:03:21 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1353351129-7108-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1353365526.11617.16.camel@x121e.pbcl.net>
In-Reply-To: <1353365526.11617.16.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: backport AArch64 support
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
X-List-Received-Date: Tue, 20 Nov 2012 07:17:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 19.11.2012 23:52, Phil Blundell pisze:
> On Mon, 2012-11-19 at 19:52 +0100, Marcin Juszkiewicz wrote:
>> @@ -1,11 +1,10 @@
>> -Upstream-Status: Backport
>> +Upstream-status: Backport
> 
> Why did you make that change?  "Upstream-Status" is the canonical
> spelling.

Ops, copy/pasted that from one file and had to do it wrong. Will update.



