Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 64AC477262
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:14:18 +0000 (UTC)
Received: by igvi2 with SMTP id i2so25497228igv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=i7QZey1xR28P4D0xWpgtFuB2N6CQnHEIjA6kxLVq60Y=;
	b=fYoEa6Y+lDFwGeNUhtoIwPJy0gzkALedsnfL/qnxz7riee8wv1H/DJuDZMcLPFNQlQ
	WgoVd2XLKFBbiewCJe9ikswa6hkEm/JxF72QQr08n6Zh6dAJ4Pz90pVs8/V6LSgpH2Jt
	IOyTrKgEM6LmEC5hLcRf8rlfozPnBSPowCMS6wHDbk0n6RCXnFMQA4Cd8KhKOFFlNM6G
	7DSrbkkOgYXawXm5JHmYhKwnc2FRx9hIF4CfvSo1PqRZrg3W99SU2/bGO37soOsTVzax
	gKaViECothBCihX7ozXShVHPRkrEQ7g8H2sNRhLvJlAVIU8FrIGXsRBNo8NmulWuYlYV
	DCxA==
X-Received: by 10.50.155.41 with SMTP id vt9mr119928igb.22.1447370058027;
	Thu, 12 Nov 2015 15:14:18 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	rt7sm376151igb.11.2015.11.12.15.14.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 15:14:16 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56451D46.50707@gmail.com>
Date: Thu, 12 Nov 2015 18:14:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: oecommit ml
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
X-List-Received-Date: Thu, 12 Nov 2015 23:14:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

It seems I missed some announcement. At first I thought I had been
unsubscribed from the openembedded-commits mailing list (since I haven't
received any emails on that list since about the end of September). So I
looked up http://lists.openembedded.org/pipermail/openembedded-commits/
and it seems to have gone quiet about that time too.

I liked being able to watch the commits to see what was going in, and to
check if my patches were added (before sending "ping"s, without having
to "git pull" and search). Is there a new workflow for seeing what's
going in?

