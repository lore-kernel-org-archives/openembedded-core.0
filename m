Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 37CEE65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 18:18:28 +0000 (UTC)
Received: by ioii196 with SMTP id i196so128307393ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IbMVZCRa933s1UG2/FKQliaRTJXjFFosvFNWP6PvA6M=;
	b=IRKDSrDvVMDNQ/RHkh6XpsGPRXTDIvLTtjIGyN7lUrcUTYr42LYEnc4fudaLvunCS8
	8pO4qnHTEiUdmXy0cumeHpRGO7flp4omxaHV9dxdxHK1RAkameRzMHa/e9w3QFWdZLQh
	AWOks8tPurAOsfGRuOX/Ax5cLKGOX6fxvkKCBJeWdvoJDLMPCW9jBBfv/sTqGJErpVm+
	pVV07mqUZQ8MICvfOy/xuFFXH/poQEUtf0ZFQL0BsKC1kIyuapPz3ERm+dFxvI9ooQu3
	+EsxDKFE+OkCxa1aenc3VI3MvVZ+IhL/MYewRgl+pw4QfwdYm7CLfRXgPO8UsG5pgoNA
	TUxw==
X-Received: by 10.107.35.78 with SMTP id j75mr8413096ioj.123.1441736308932;
	Tue, 08 Sep 2015 11:18:28 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f31sm2401128ioj.13.2015.09.08.11.18.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 11:18:28 -0700 (PDT)
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <55EF2670.6040101@gmail.com>
Date: Tue, 8 Sep 2015 14:18:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441177787.24871.33.camel@linuxfoundation.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 08 Sep 2015 18:18:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

If Richard doesn't want to use gerrit for OE-core, that doesn't exclude
others from using it for the layers they manage, does it?

