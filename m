Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1vEd-0000LG-QS
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 10:15:19 +0200
Received: by eekb57 with SMTP id b57so572702eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 01:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=YWaJVP+LEr2dtCF4rN84RHc8nTLd0l0YAP38SKPP4zg=;
	b=oqkWTaUKTxM8R5a0b7Theh2YIYJvxxoXVS8RkFC41asbS3dc88iQCzvprLaKJK6Ubm
	bIPPeUSjqWdzl1wKqNbeqDGnBR47bYk1su8EQgxzmvsX8WMohHXWDFYwHWwf1AyIhHmR
	IDSlCCWQQ1wsI6K7cqqLWNptXw8AB0OEEElyw3k/7lgMS49bbQxiBtA2xvzyRgIvZiPe
	THd/Tl1jlmL+K43BKsCEyoG0I0cRrSusuFvcTZe0ycSz3XZehWCaWyFYsm687XIB/fa0
	QPIaklHAFf/9IHUMUfJx0zjgYbLVFgJOjZcld0zntNrEsJzNgpjzq3h7p5W+3vdfd6Sq
	89qA==
Received: by 10.14.199.67 with SMTP id w43mr383109een.33.1345104202632;
	Thu, 16 Aug 2012 01:03:22 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d48sm9825107eeo.10.2012.08.16.01.03.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 01:03:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <520fd5fd5b910a65ddc91a9e747b092050fd0dbf.1345044352.git.liezhi.yang@windriver.com>
Date: Thu, 16 Aug 2012 10:03:20 +0200
Message-Id: <32C1BA52-8980-47D2-908D-B94EBED60C1E@dominion.thruhere.net>
References: <cover.1345044352.git.liezhi.yang@windriver.com>
	<520fd5fd5b910a65ddc91a9e747b092050fd0dbf.1345044352.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmzivROAyhOE5mEx6H27sNxZ/Yd5HLLohS6fxvhl9fqSAfa+mfwfpZ5ulsvtNO+G/mAATrA
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/3] ipk: install external binary packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 08:15:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2012, om 17:32 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:

> Please see the commit message for the rpm one,=20

No, you copy-paste that message into this commit message.=


