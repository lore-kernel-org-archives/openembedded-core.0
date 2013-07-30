Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 15FE06B451
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 17:30:05 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so591605pbb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vqjKhlz1xai+sygNMp3yrLd+lfZGuOLw7gaqjDx/Tj4=;
	b=OYFv8tXTX/4OoFf35kqGgYwWBMboYqNzXgIqhE3LkrbfsHvom6rVsansStmXcGn2wI
	1DaMU/gkYnAiZOOXlUpg5MwPvjoEHJtI9cB8KLOzBHQHPByZZuU5h/xhAdRwOw30wGKD
	ZCXQjjwTi5UrllQPUej9/PL23yZ3etbw9SutLw79K4gmwxCCcZJlzhvmwaSHlkqcu7B7
	PR6aUdoIy1YozCIxOnDVu7GyVvV6bArilnxk+qpy4DZDY3aDnQ0DP7qf3cYILCim9PJW
	u4YwtGO517Wy+77EXqkOj/QoLy1kJZyS9gilXuCv9vB5dZxybCPGVsAUfORofpUUwDp9
	Pbgg==
X-Received: by 10.66.163.164 with SMTP id yj4mr52269400pab.91.1375205405865;
	Tue, 30 Jul 2013 10:30:05 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qb15sm28170921pab.13.2013.07.30.10.30.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 10:30:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F7DD5E.2000407@linux.intel.com>
Date: Tue, 30 Jul 2013 10:30:01 -0700
Message-Id: <AF6AFBE1-0607-445F-AA52-289A8AEFE52B@gmail.com>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
	<21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
	<7891D5A0-7EB3-4A7A-99EC-962DC7EF9764@gmail.com>
	<8237333.h1yk84NkVT@helios>
	<1E8D28AF-6657-4E48-B7D6-79D4A29A3095@gmail.com>
	<51F7DD5E.2000407@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: fix PACKAGECONFIG options
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
X-List-Received-Date: Tue, 30 Jul 2013 17:30:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 30, 2013, at 8:35 AM, Saul Wold <sgw@linux.intel.com> wrote:

> It's pending on oe-contrib/sgw/stage, a series of 3 =
Update-Alternatives for busybox, util-linux and shadow,
>=20

I see. thx=

