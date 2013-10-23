Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4AD6CF3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 07:52:35 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f13so252336vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=olZYP/g0UzHoZd2XD4bTugAByWqQDiVx3hOD3crrt68=;
	b=Q6NY9ZUoyVMg8tlZw0nBeJtWM76uMQFdydD5jNg/DBA1LvZbht3Rrt5iVgdK9nKCYp
	GypMTpWTR4LAXuYJ5XNgdB+qkGSnRDK1es+31TwB34/Lprahyk8LFs80DzZZb86ZusYl
	VBRJL6BnHvXDqZWDg1ocwoXhF9zSayZzID491dSIElI+r3/EbU17Tw6sQqrIy0qSXJXr
	cPX3lIXIR3mwbBro8s0XtZphqhskTfVwMeJdpYtXe4o8uuVJ49gwd2b1FerJWGDrxPuz
	q4KU4+j1bdfv4jFWUda3hlYUno9aLxSfckzGfE7obawtHHsK/ovQC56UaKNk0T4AenVK
	oh9w==
X-Gm-Message-State: ALoCoQmglAGWjPfLD0FQzoFljADXmBqJdCAGY7AsKyf7Ir2bPQeh0Y3xlq1DxqrF4lOmRwD7n6E2
X-Received: by 10.52.100.202 with SMTP id fa10mr84918vdb.0.1382514756520; Wed,
	23 Oct 2013 00:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 23 Oct 2013 00:52:16 -0700 (PDT)
In-Reply-To: <5266FC9F.5050109@communistcode.co.uk>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<5266E3C2.6040502@linux.intel.com>
	<5266FC9F.5050109@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Oct 2013 08:52:16 +0100
Message-ID: <CAJTo0LZkMUSv7cErf9Et_12t6ukmQWVYfGkKJfeESPRTzv8TQw@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Wed, 23 Oct 2013 07:52:35 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2013 23:30, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Urgh, this library is a PITA. I'm going to be at the Dev Day/ELC-E myself so
> I might seek some professional guidance ;)

[plug] there's a maintainer Q&A session this morning... :)

Ross

