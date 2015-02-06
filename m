Return-Path: <ccna.syl@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id E254B6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:18:48 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id l4so17877939lbv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YaSuDDSTzBUurMnN/x/lrin2HQxHd1Ir/qCZ/i3M9gk=;
	b=ipTo5UT9YrlFJdKnn8SH/7UCBJAp4IAw2uMcFKTwYTZc+NGCBJSIHYQhoShsMkfMrE
	C5jAOy1wXNM6jGu+pmzI1T2WjzIOrS+z6qruy5RolPQq0fKb8xRl2ZBe67cs96VJecQz
	qMRQbFTL8DwAq17fx0fZAAF0F+BpvB/t+BuFAnxgiTmnx4YRxQJFSCRd7Y0orZeNwG5G
	9GoOSOiOadGGE/nICE2m9sE/8+h59rGvukfjS3LwxS7r+MBXvatunVtPs1xZSCB+VvPJ
	moOslo9fVsGIeNL8w4WO1FSQDgAaqIB39r+IaxLIgw5XP5CbfsXudCqsKtCoxH3PJ+Lm
	R9wA==
X-Received: by 10.112.110.103 with SMTP id hz7mr2691444lbb.62.1423228728816;
	Fri, 06 Feb 2015 05:18:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.202.228 with HTTP; Fri, 6 Feb 2015 05:18:28 -0800 (PST)
In-Reply-To: <54D4B448.5040707@pabigot.com>
References: <20150206114251.GB2007@gmail.com> <54D4B448.5040707@pabigot.com>
From: Sylvestre Gallon <ccna.syl@gmail.com>
Date: Fri, 6 Feb 2015 14:18:28 +0100
Message-ID: <CABOJwQbJiqqLLudVCxFTuG4L67zrH+8nsUp_Y6haODD-zWThUA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: add bluetooth-bluez5 distro feature
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
X-List-Received-Date: Fri, 06 Feb 2015 13:18:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 1:32 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 02/06/2015 05:42 AM, Sylvestre Gallon wrote:
>>
>> Hi,
>>
>> Here is an attempt to add the bluetooth-bluez5 distro feature. This
>> feature
>> will allow to generate an image using bluez5 instead of bluez4.
>
>
> There's a patch set that's still awaiting review since November for this
> that some folks have been using.  It does need a minor rebase, which I'll
> try to push to the contrib area this weekend.
>
> http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099312.html
>
> Peter
>

Sorry for the noise. I haven't seen this patch set before posting.

Thanks,
-- 
Sylvestre Gallon

