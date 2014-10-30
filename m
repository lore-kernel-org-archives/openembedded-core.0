Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 374C365C87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:42:23 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id tp5so5601696ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 08:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=y8hy38j7oedLfoqP9XCkA3MU7NpSJwYAbyUpWQoH7HU=;
	b=Cofj85xW3EtZCrGZtCbXSqvP1L+7BysUNTqLvoFcfKyLHJavJqaUkTGEHy0Sr8du9R
	h70WbxFXazQl/52oeqzH8fenXQ1d2yuSYKxB/uFkz85x+M+W04Fi6SVbiTIoYqH3P6BR
	J6SE/HBTIMRkXgmfXYl0iUF/D2yhDvPN79BQEzQa4phRKeunFJURuwe48r5IHGok36wa
	3ug/Lykpc19vim/OMmiwI8j+gKydTxon2ZDD+lkjEBrKQK4zDNyjeU3RBuOe4Zx5vXAh
	igPqy2WhU2hFXwyUDMgUtU0I/m1ErpKeXlA03mrwRL8NArqBipFag3vWG2mrqXmbv81n
	paWQ==
X-Gm-Message-State: ALoCoQnMs/sBTb72QkVf51X9qbK4nBCcwDw98ZMxnNnEfa4TQHlcjR6egXMod8Ue/iqN36s1al9L
X-Received: by 10.50.118.35 with SMTP id kj3mr21410771igb.30.1414683744392;
	Thu, 30 Oct 2014 08:42:24 -0700 (PDT)
Received: from [192.168.141.122] ([67.55.43.177])
	by mx.google.com with ESMTPSA id qa7sm3194742igb.1.2014.10.30.08.42.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 08:42:23 -0700 (PDT)
Message-ID: <54525C63.4070309@linaro.org>
Date: Thu, 30 Oct 2014 11:42:27 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	Yocto discussion list <yocto@yoctoproject.org>,
	OE Core <openembedded-core@lists.openembedded.org>
References: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
In-Reply-To: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
Subject: Re: opkg Status Update
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
X-List-Received-Date: Thu, 30 Oct 2014 15:42:26 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Paul,

I too wanted to express my thanks to you for this work!

On 10/28/14 19:33, Paul Barker wrote:
> This would be a great time for someone to step up and
> help move things forward to v0.4.0 and beyond.

Is there a roadmap for opkg somewhere?

Best regards,
    Trevor

