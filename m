Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 32680605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 03:58:29 +0000 (UTC)
Received: by igcto18 with SMTP id to18so29205419igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 19:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=aAGeF7qLmwTLgXzU5J3c2iGlZNmpbsOToTnBBYt2c9E=;
	b=Wl4RGRqc1++CNc2RTHpur7Hs45VSQZbOqcYAEDLxRTQYDzJLmNT/NfCZPgQwN7NWMG
	DBxRTWOdm/QrnuhB7XgXdfU1FHC9Kdcvu+EVAbZ4Qk5WxIAoL5fFsj7woK7uf7qvV2VN
	7G9OgcPDdRe3bUZUM1xcEesmwFYLuPipaQL1yX7n8VcPTCGwgcR3i75Ac/9+9xSnuh9D
	7SsqzQs/MsLgn1/9IH1+qtOQ/jxWDj3f9lseo39r7YdJb1FXBQx/fJDtqS6tZyOtLT6B
	JmOp9t+TKqemx8N6uVwnKG+sBlB1vxU60x/ynwnEfjShdUbiIumVh+FJQLKFV53jn/sS
	0HQQ==
X-Received: by 10.50.80.14 with SMTP id n14mr1908041igx.56.1448423910617;
	Tue, 24 Nov 2015 19:58:30 -0800 (PST)
Received: from [192.168.1.84] (71-219-195-228.clsp.qwest.net. [71.219.195.228])
	by smtp.googlemail.com with ESMTPSA id
	qb7sm751766igb.8.2015.11.24.19.58.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 19:58:29 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1447744712-18615-1-git-send-email-wenzong.fan@windriver.com>
	<564BD815.2090204@gmail.com>
	<CAJTo0LZ6jvDWp006DM7EjJi1KW-mm3MTb0VygdC8NdE03NogVw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <565531E4.2080201@gmail.com>
Date: Tue, 24 Nov 2015 19:58:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ6jvDWp006DM7EjJi1KW-mm3MTb0VygdC8NdE03NogVw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: Security Advisory - rpcbind - CVE-2015-7236
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
X-List-Received-Date: Wed, 25 Nov 2015 03:58:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/18/2015 02:50 PM, Burton, Ross wrote:
> On 18 November 2015 at 01:44, akuster808 <akuster808@gmail.com> wrote:
> 
>> Can we get the CVE mentioned in the patch or rename the the patch to
>> include the CVE #.
>>
> 
> I'd already merged this into mut, so have renamed the patch.

thanks.

- armin
> 
> Ross
> 

