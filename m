Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id D65156E989
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:49:19 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so5003392yho.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rNKB6OG0lH/3Rfht9w2jab6tXwMh9I+bMW2VEwB+ggg=;
	b=U5hSFN54llxilHktbFfbuqy1mG/ovoptACc8ygRNoHQkCHze60S/RkdQaewFSHm8+X
	wN5iHb3p5+L2hcMj4kWMrQRhvpAeaUuJEH9FMMUYdDIp6VW69Jk9vYysmB9g8CKPzcDk
	0YJX4oYJr0RF2j/wXb77FFITIpHvdhfkV6ZCpZ5o5fhG7KwO/nAlwHhSTM+GtoivfJGk
	5I10lO3/f4SVhi9/0Q6zsiRwukhmoV+o7WN5KuOxYBiedpXKIXr7MyDPlCUDsZZlkqat
	yX6OPiWPLM22qUZ6JavJ+jDZebmSFuyJm+FN/zqO3n37AtZObtC4vBJUb5dGyBHppHwE
	FTsA==
MIME-Version: 1.0
X-Received: by 10.236.152.233 with SMTP id d69mr25730037yhk.11.1394228960433; 
	Fri, 07 Mar 2014 13:49:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 7 Mar 2014 13:49:20 -0800 (PST)
In-Reply-To: <1394227487-27845-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1394227487-27845-1-git-send-email-lauren.post@freescale.com>
Date: Fri, 7 Mar 2014 18:49:20 -0300
X-Google-Sender-Auth: Slhh8VMMDPYJateBwbkJ5Dg9rbg
Message-ID: <CAP9ODKoPoK+MA99d25Whnfo9f6o2gtZXFeGTc417xCBFanWB1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lauren Post <lauren.post@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH] mtd-utils: Update version to include fixes after 1.5.0
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
X-List-Received-Date: Fri, 07 Mar 2014 21:49:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Lauren,

Good to see you here :-)

On Fri, Mar 7, 2014 at 6:24 PM, Lauren Post <lauren.post@freescale.com> wrote:
> This includes fixes on master branch not in the 1.5.0 release
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

The only remark is the subject which you shouldn't need to add as
'poky' as this is for OE-Core in reality.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

