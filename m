Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7054F6AB93
	for <Openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 11:38:38 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u10so1544375pdi.36
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=YCqa95flT3ze6GMiGP5t9vOD/Ak07+vPBIIzUVsF1nk=;
	b=r/ZsliovTLmD25bRKwKER5JejDE39C6CU1T0o15tzJwxY6mK6tHnupEKH0jwjdMItT
	W2/hNUmW+slehn06xgoGUYUG44ScvpmcggCs23HPM9PL+mkS+qFqLL4B6mOlLOV8lb57
	+OwOiaTzmPuKUv4yquBfZCnaNzIJGu+8rf/nOBzso2iXh94/ci2CDwTMXKcS9cgE6qhk
	MjzF1g3bL88JUH1Rs2Wd+EkgrZrmg9iX2SH+9n/Ns5VjLkV0VwO57ZS8JNc7iQj2l0X+
	zu0CZY4nI1xoqv9cJfZVSpm4OGIkukPeLmZyxRYXoDeB7ydmclIx64LmSgLz2qxwbB7H
	PPyg==
X-Received: by 10.66.194.13 with SMTP id hs13mr15217882pac.163.1375529919212; 
	Sat, 03 Aug 2013 04:38:39 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id z14sm15803613pbt.0.2013.08.03.04.38.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 04:38:38 -0700 (PDT)
Message-ID: <51FCEA92.8040508@gmail.com>
Date: Sat, 03 Aug 2013 21:33:38 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <7F497479-61B1-4F37-B910-670CEB93FA46@gmail.com>
In-Reply-To: <7F497479-61B1-4F37-B910-670CEB93FA46@gmail.com>
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: is someone working on upgrading systemd 205 into OE-Core ?
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
X-List-Received-Date: Sat, 03 Aug 2013 11:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2013 3:06 PM, Khem Raj wrote:
> Hi
>
> Wanted to know before duplicating effort. If someone is working on it please speak up
>
> -Khem
As far as I know there aren't any people working on it. systemd is up to 
206 now.

Regards,
Jonathan

