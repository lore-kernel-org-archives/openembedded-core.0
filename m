Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Tihgp-0006vi-9E
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 09:29:16 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so353803pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 00:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=Tm/q84r9xQ6wbQIIpMwx+Bhh7eIo1PNXpghlI1v9hws=;
	b=eocdVSd3XQbED/iX/QsnU2wXbBYz2Fo64CFJyI/kVmMaTbRQmQVGXqjVtBvkRNkD+h
	dMpotOqfec9PZK2E3EUuF/gQE/ciIf1DOC9vyb280wbxF8gbcy+j7k/Bnj2m6w0zOfuB
	XiU4Bbk8gtNmcn5cinpz8wLisYw0vaSuDRqfzEAkG+XI86GVX+5S0lNWkGoP3RsaC7J7
	ZbDD1aTG6GPcAn2POahTKjMLfOEJNQuSK4BPghUP3WDOD7I/m8bc2XWk8lDqkeAMOEZi
	wHQ4qoxUDRL9nqTEg54hS9pXZn83DV/O/+pqV/Ul9b/uT8NGRLh18ktSifnRsmdCNFXG
	l0tA==
Received: by 10.66.75.234 with SMTP id f10mr470560paw.32.1355300081130;
	Wed, 12 Dec 2012 00:14:41 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.163.48])
	by mx.google.com with ESMTPS id i5sm15417057pax.13.2012.12.12.00.14.38
	(version=SSLv3 cipher=OTHER); Wed, 12 Dec 2012 00:14:40 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 16:13:16 +0000
Message-ID: <2617323.R94UMbB4eu@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
MIME-Version: 1.0
Subject: how about the 'systemd' status?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 08:29:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi, All!

how about the systemd status?
I'm using Arch Linux, after transite to systemd, the time from power on to 
enter desktop has been greatly improved.

So I doubt the systemd status about yocto.
(the "meta-systemd' is labed deprecated.)

on the openembedded.org, the systemd is meta-openembedded, indeed, I'm 
confused by the `openembedded-core' and `meta-openembedded'.


