Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 23F6F7210F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:21:47 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so13290159pab.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=D+PnRB6SgnSNogheKB8PtEllMxap6uv7vYarEsaGY6A=;
	b=hqnCmXzfM6n5iMWzrIhL3jKwDbYQRWW5CozGU/OKGYIYuIbkFJtlyo/K2BX9KtcNz2
	MNrEnnSl2BkuX4/CXKmp0VlEiJlCnCdzy/DoD2/1UAo/XT+1YLsk4+ipC+8pf7yGAN12
	BTB5fgniENQXiRwacpkEk8L1R0pzWlOqC1ECQFJuqTCWFseDAER7H6JnM/cOaD2JRoGp
	1esqCtDicj2ra0pnMCVW4dig/kW6GU9qTzR+bB9FmnCBRh0sw3fnRZwemplmcjKB1Nhv
	rvKWiegH5GVyRaX1TM8kRqDT0bHng1nZx9kq3HSQ6jXkrS+0D/1ZukUYOQwoy+k+npUA
	UT6g==
X-Received: by 10.66.255.41 with SMTP id an9mr48908764pad.54.1415809308226;
	Wed, 12 Nov 2014 08:21:48 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:5d34:bd2e:5ccb:3cce?
	([2601:c:9380:601:5d34:bd2e:5ccb:3cce])
	by mx.google.com with ESMTPSA id
	ub7sm22586861pbc.30.2014.11.12.08.21.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 08:21:47 -0800 (PST)
Message-ID: <54638918.2040500@gmail.com>
Date: Wed, 12 Nov 2014 08:21:44 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Andrei Gherzan <andrei@gherzan.ro>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>	<CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
	<CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Wed, 12 Nov 2014 16:21:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2014 08:01 AM, Burton, Ross wrote:
>
> On 12 November 2014 10:28, Andrei Gherzan <andrei@gherzan.ro
> <mailto:andrei@gherzan.ro>> wrote:
>
>     Ping?
>
>
> Managed to totally miss this due to the dizzy tag, sorry for that.
> Thanks for the ping, merged to mut.

What part did you take care of? Master or Dizzy?

Armin

>
> Ross
>
>

