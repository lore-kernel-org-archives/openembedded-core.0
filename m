Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id DFAC16007C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 08:54:48 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id h11so99585vbh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 01:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9ZgvVZzL2cwAw4exipmHSFYtnYX7IlvbUYDDNyOusAA=;
	b=GdLF3+a3sjju0LLDzQ+vvXzf3dkUlFBg9gpAxyA5n7C8byAGqQ9g/cui2dWRUISRp1
	lRxbcRQ8aq7JS25UBAgO47v5jI/VcE0huhCxnIQMCpXI/9qXpB2fzIkBST0ZElxebZIZ
	FrC9UF1kU+DO8EGiV2e+GQhnvLH4Y07ZawW9Pc9xvUFF4knm7wSoI1LP2bg5q1+btDaS
	hyR3/KBKZSLKueUaQt1u+cHoHh0+F3QloSNQVd7y0cAAktWQD9/PJGvnrC5AJRmAu/CU
	OuoPDQQNVIOcE8lhNkwAqz2aidHCTw5D7Lb0W4L5NPoTxH4T70+tE72PVg2mhSoSPyJI
	dm5Q==
X-Gm-Message-State: ALoCoQnJkOU9nx4gWS8dN5n2SkS+7xjm1sR+6xJOmrfGPFuurQFE/2pnp/FOOkyp2CKAURFDjfdL
X-Received: by 10.58.181.225 with SMTP id dz1mr46803vec.95.1375779289334; Tue,
	06 Aug 2013 01:54:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 6 Aug 2013 01:54:29 -0700 (PDT)
In-Reply-To: <cover.1375772719.git.sgw@linux.intel.com>
References: <cover.1375772719.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Aug 2013 09:54:29 +0100
Message-ID: <CAJTo0LbWbnLQEGUATBsz1KBeVGFua7nNum-TRqomBvpGM=70HA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: otavio@ossystems.com.br, paul.eggleton@linux.intel.com,
	dvhart@linux.intel.com, zhenhua.luo@freescale.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/35] Review and ACK
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
X-List-Received-Date: Tue, 06 Aug 2013 08:54:49 -0000
Content-Type: text/plain; charset=UTF-8

On 6 August 2013 08:13, Saul Wold <sgw@linux.intel.com> wrote:
> The following changes since commit bc6258f88705b0e7989089a8666ac5e5d2355823:
>
>   grep: Add patch for texinfo 5.1 (2013-08-02 08:21:17 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Acked-By: Ross Burton <ross.burton@intel.com>

