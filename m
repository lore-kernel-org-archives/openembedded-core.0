Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rutl1-000428-S2
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:43:27 +0100
Received: by lahc1 with SMTP id c1so4568142lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 14:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=UwQiGCGgdV7en6uyZVLRnbVTwXn7+0wyEMsBRJej4Pg=;
	b=BgYnwUaV+GrxSqzVCfVMX97rmxssdy1AOLTz9VVkhL8lF4m9l1pO7K1eEEmsxWcyJh
	3V5Ru09H0UTC3DG3OtGnYNMlQInucHm/XrWLXRbvaEIIIMrrEKvBNc+mKvZguJ4Ey7Rr
	4mftnCVt5XZocX7bla/yewqsNfeGMKIBnOx4o=
Received: by 10.112.85.70 with SMTP id f6mr101650lbz.16.1328654125244; Tue, 07
	Feb 2012 14:35:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 14:34:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 14:34:55 -0800
Message-ID: <CAMKF1srWQ6+CbbZm-6mEp-yKAjBz972VK+FVcnSS4BGKjyjmHw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: GCC testsuite results
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
X-List-Received-Date: Tue, 07 Feb 2012 22:43:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have stored the dejaGNU testresults for oe-core based gcc here

http://sakrah.homelinux.org/files/gcc-tests/

Right now its only for uclibc based tookchais but I will soon be
adding eglibc based toolchain results there
and will keep it updated whenever we have some compiler code
generation changes

Thanks
-Khem


