Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id D93117066B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 20:10:29 +0000 (UTC)
Received: by qcej9 with SMTP id j9so9297844qce.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=iVyovKDFsjMCF0VXPMgOFy0mQNXEIQ1iPyDum7e9E/M=;
	b=muHQpBhws/bmGEQLr9UPb5sp57X0BHe9l5D2JS9VpgNR+Isz3lQLNKdqvU+2zYF5fV
	WRolVFJ3L5BWu7OS0Yb2RHi18enUbaDQtdkPV71Kp8MHLt+i8dIanxeavMDLozHDS/2l
	VmylWwuDIXkvS+iXl1Nds0i8HFmOqMJwVCYNH6NSyvQmUppLtt3gM6MDERSVaEBYON/z
	k3BcjOrdCLcRSjlG2kb55Wc+7P9kSRa1WrDuNlsMbxyWfpWFNeQYIgsdLmlH+dSMxW/J
	1j69C7RxKgLRxju/pFIVJyxwxjzjma9Nqc64KrmtbxbkVmzNqa7wl9UGFZ+tDMKecNY8
	5Ebw==
X-Received: by 10.55.23.130 with SMTP id 2mr61101148qkx.33.1433362231100;
	Wed, 03 Jun 2015 13:10:31 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:1852:4388:a4f2:fd8?
	([2601:c:a700:3ba7:1852:4388:a4f2:fd8])
	by mx.google.com with ESMTPSA id c80sm1008185qge.49.2015.06.03.13.10.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 13:10:29 -0700 (PDT)
Message-ID: <556F5F2F.7020009@gmail.com>
Date: Wed, 03 Jun 2015 13:10:23 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433167180.git.akuster808@gmail.com>
	<CAJTo0LZHhxEYk2m4_gS_THgssWF9cVHGULprcrUEwoeQjk1C2Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZHhxEYk2m4_gS_THgssWF9cVHGULprcrUEwoeQjk1C2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Gnutls 3.4.1 update
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
X-List-Received-Date: Wed, 03 Jun 2015 20:10:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2015 03:23 AM, Burton, Ross wrote:
> Hi Armin,
>
> On 1 June 2015 at 15:12, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     core-image-minimal builds but not sato or oe-core world. I am
>     providing this so those who want can test their apps with these changes.
>
>
> What's the scale of the breakage when building oe-core world?
>

World builds now.

- armin
> Ross

