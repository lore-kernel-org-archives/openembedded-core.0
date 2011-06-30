Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcIJG-0008IL-8A
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 16:33:38 +0200
Received: by iym10 with SMTP id 10so2164234iym.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IkHgrCqz94yabzc8+FUI6Xc5hC56tqCQ0Wmm+P+ln2k=;
	b=HRb4kw299+4HnTq1ljGKWyDa7NKY3HMfPJu8kWw2gm6pl65h4kKEKm14QOsLHhDXhV
	KMFumzQ67Gc3FGBgqL2sjRRTg89d/kX1S55slo9jhlB8WUDSYXYU1UALA3EAwHwz86/y
	RgEP00tq4AUmqPQO5iqE6bZte+TOycW/FwnZk=
Received: by 10.42.172.10 with SMTP id l10mr2180942icz.468.1309444192189;
	Thu, 30 Jun 2011 07:29:52 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f19sm1256123ibl.66.2011.06.30.07.29.50
	(version=SSLv3 cipher=OTHER); Thu, 30 Jun 2011 07:29:50 -0700 (PDT)
Message-ID: <4E0C885D.9000505@gmail.com>
Date: Thu, 30 Jun 2011 07:29:49 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308219330.25285.4194.camel@phil-desktop>	<4DFA0824.5030809@gmail.com>
	<1308234598.25285.4740.camel@phil-desktop>	<4DFA8F49.8000309@gmail.com>
	<1309429954.2551.109.camel@phil-desktop>
In-Reply-To: <1309429954.2551.109.camel@phil-desktop>
Subject: Re: eglibc testing?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 14:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 03:32 AM, Phil Blundell wrote:
> On Thu, 2011-06-16 at 16:18 -0700, Khem Raj wrote:
>> Yes I think I should put together my mechanism somewhere and post it
>> and dejaGNU setup I use for cross testing
>
> Did you get a chance to do this at all?
>

so far no. Let me collect them and make sure they work

> thanks
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



