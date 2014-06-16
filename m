Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id EB9486FF05;
	Mon, 16 Jun 2014 16:36:40 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so4575700pdi.23
	for <multiple recipients>; Mon, 16 Jun 2014 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=o/hc+DpoiR/E4voHd3jr1bFpZOOj77wQV+vpzPraeJQ=;
	b=waQuM3nz5KPun3hjINBTaaeoQaeS9PB1M4Fc3a/TmhAWtNOtEDIgwo2P22elSZiCXL
	UCXOKZ0OMCCIB4qdviAzz3xGozDKJP7BnxXgoP6TgKfACU0HSNxMUeRkZ0zLnMAbzz+a
	cn+1jlAEsR2uKilN7lY6mh2EX/GBy9XU9bJGBld2qYef47fMj7ZWutSeWp1l85qCQzxN
	LmyFiyaYuENW0M93POnAumNL3rcScoM/nlVblWKaBCHFgtf24ZiV9UvZ0ZYDpiMZXlBF
	VeDHeRURDOawTQGXYbGBr6GIb7jcBr0uyUaOzIdjzI7TWHH2oCWmaXgowiZi+XcfbkAI
	1o0Q==
X-Received: by 10.68.239.137 with SMTP id vs9mr25690086pbc.84.1402936601182;
	Mon, 16 Jun 2014 09:36:41 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	uj2sm71189027pab.14.2014.06.16.09.36.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Jun 2014 09:36:39 -0700 (PDT)
Message-ID: <539F1D15.8090304@gmail.com>
Date: Mon, 16 Jun 2014 09:36:37 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	Steffen Sledz <sledz@dresearch-fe.de>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>	<539E8F97.3070508@dresearch-fe.de>	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>	<539EBCA8.3000709@dresearch-fe.de>
	<20140616105942.GO2428@jama>
In-Reply-To: <20140616105942.GO2428@jama>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jun 2014 16:36:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin,

You can add me as a meta-oe daisy maintainer, if there is still a need.

- Armin

On 06/16/2014 03:59 AM, Martin Jansa wrote:
> On Mon, Jun 16, 2014 at 11:45:12AM +0200, Steffen Sledz wrote:
>> On 16.06.2014 10:48, Paul Eggleton wrote:
>>> On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
>>>> What is the right ML address for patches in this area?
>>>>
>>>> The meta-multimedia/README in git://git.openembedded.org/meta-openembedded
>>>> (daisy branch) says:
>>>>
>>>>    "Send pull requests to openembedded-devel@lists.openembedded.org"
>>>>
>>>> But i believe this should be openembedded-core@lists.openembedded.org.
>>>
>>> No, for all layers in the meta-openembedded repository it should be
>>> openembedded-devel as listed.
>>
>> OK, thx for this info.
>>
>> So i hope the patch will make it into the daisy branch in the next time, because our build is broken meanwhile (OK, we have a workaround, but this is unendearing).
>
> We still don't have meta-oe daisy maintainer :/ (and update to READMEs
> in daisy branch)..
>
>
>

