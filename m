Return-Path: <scott.a.garman@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 20DAD60D8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 18:34:31 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so27672pde.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 10:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YiMi+fNsea8kwp5XwWP2sIG0LJ0KldBgQhYyCpd4S18=;
	b=BSOiO3jld7X3ufcNo5URwGuA0rNHFNPxlDHcZm9Pf/RE3BXZOFGMsABY9C7ZRDc6dy
	lgIig+Xad1GWj5yzk3Ev8SihbNRkqYTs0v9hSJ166bN0O4+Lz1KHuBxAOfIm+h18JeLO
	wjKcbmpHzendDMlUYZAryW0pBrCD6P/Hcr0aQohb13KcQoReWpXcOEFXMHJlYImgWhfk
	e9PcStcG96NBfpBa92LbV7HDAcZo5fvdLgVkPIMKZGS2Ke+O9uByEBZQqIFjkJBSB/EB
	Pdl2/4ftLZ5m5p8dD7ujcvWy1/2/WdZZdU0Ji2JlEdf0D1yRWiUig42RMsuxYUsLIYxF
	rfyA==
X-Gm-Message-State: ALoCoQkHPnX2Rp9YB+DaybDD9aWh4zcF6ZeCuMhfnb/KTUR/fMoSyRcrqjF2kEoYbGC3/j39WVRE
X-Received: by 10.68.163.33 with SMTP id yf1mr35384552pbb.143.1387391672208;
	Wed, 18 Dec 2013 10:34:32 -0800 (PST)
Received: from [10.1.10.14] (c-24-20-145-95.hsd1.or.comcast.net.
	[24.20.145.95])
	by mx.google.com with ESMTPSA id pe3sm1619179pbc.23.2013.12.18.10.34.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 10:34:31 -0800 (PST)
Message-ID: <52B1EAB6.1040107@intel.com>
Date: Wed, 18 Dec 2013 10:34:30 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1386279548.git.scott.a.garman@intel.com>
	<52B1DD24.5040606@intel.com> <52B1DE95.5040209@linux.intel.com>
In-Reply-To: <52B1DE95.5040209@linux.intel.com>
Subject: Re: [PATCH 0/1] runqemu fix for bug #5617
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
X-List-Received-Date: Wed, 18 Dec 2013 18:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2013 09:42 AM, Saul Wold wrote:
> On 12/18/2013 09:36 AM, Scott Garman wrote:
>> Ping reminder on this patch.
>>
>
> I believe it was merged last week, did you update master?

Doh, sorry - I should have checked first. Thanks!

I'll mark the bug as fixed.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center

