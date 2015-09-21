Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7260F65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 19:08:51 +0000 (UTC)
Received: by igxx6 with SMTP id x6so64718283igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=G1ioB3lRWl+fgp0IfjvHjGXhPQ1WDDwSKrjOjjmI/8c=;
	b=IWvVJI5yDSMPhIBCYQeCNBjN0+PD7DHjRE+Mfu5hFIFvhUIO5K/P13VfioqEy2M0eo
	v5GCWpOnQbCdELxJsz6qILnPFv5GFqGSr/bDiWSY8KpOUB+e9wN+/CMCtrjhtEFFK04H
	1uEkbVZ6vEyUyf23dvddIIY/onXNJ5U4O0zvR/KscuBUvBU7WEkj2jOogihAfJ1820Gw
	4pGdcjT+M3vJpefvgHRhk/wwCcMnEa2VO7XBtb59qoJWYjeI3+ouREt6clzQfT3+DdEC
	APX6H3G42wAp/rkd44YqKKaX91Gc+MihiBH/lXL+eLPATrO7hwbckXT4mtEZSbYV8IGf
	zt9g==
X-Received: by 10.50.87.98 with SMTP id w2mr13216227igz.60.1442862530962;
	Mon, 21 Sep 2015 12:08:50 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	t2sm6070687igs.18.2015.09.21.12.08.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 12:08:50 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <56001431.6030001@gmail.com>
	<CAMKF1sqomLPSg3Fn9jJfwJFGnfquM81hpjELX_VuWQw-t7jfww@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <560055BF.8070802@gmail.com>
Date: Mon, 21 Sep 2015 15:08:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqomLPSg3Fn9jJfwJFGnfquM81hpjELX_VuWQw-t7jfww@mail.gmail.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: packageconfig for non-autotooled project
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
X-List-Received-Date: Mon, 21 Sep 2015 19:08:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hey Khem,

On 09/21/15 13:03, Khem Raj wrote:
>
> Look at the patches I have posted for raspberry pi layer
>

Found them. Awesome, thanks! :-)

