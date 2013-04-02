Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UN267-0008Py-Tc
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 16:22:07 +0200
Received: by mail-vc0-f170.google.com with SMTP id lf10so456843vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=uh4GOP7SDnCSeOs4Kc+04yCNnutlUCfsNx/sP65OXj8=;
	b=ckOJ2jNpuSmu4umcXjZrX4IPf5S6+uonfQY4o4yjDaQnrvmo8jZC49QUZh0AuRrfE9
	wqrKKwtJVARKSRu8xIm8MsT7cB3Ke1UnbNc8RQ1+KI7cb7QMbdvrvL5O/Jjq/aekScdk
	vcq70iOYsPgnhbeHsjdCrKGRwBgY0G3g9KYGx5QupUw7IRIAyUPQmu92LRq1K2dn6+e8
	yuH2J5kYR13MJyUNbL6DGnCL7xrtqqn21R6n6wjXkW/7dY1X93G4/4phE2xvVQrQfpwW
	fLqpdvs3UKvdWzNuELrvSGHf8llD3r8aCTatAvrjZgzq+Pu1ec2OMskxo0CwwCjpuU85
	LqEg==
MIME-Version: 1.0
X-Received: by 10.220.221.210 with SMTP id id18mr12479329vcb.74.1364911493693; 
	Tue, 02 Apr 2013 07:04:53 -0700 (PDT)
Received: by 10.59.11.37 with HTTP; Tue, 2 Apr 2013 07:04:53 -0700 (PDT)
Date: Tue, 2 Apr 2013 10:04:53 -0400
Message-ID: <CAHu+ux3OLHvwH-0yD0LVfPDTAR-dQgjXpg_Y-DJMTurYsFfv3g@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Removing qt4-embedded-gles for tisdk-rootfs-image
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
X-List-Received-Date: Tue, 02 Apr 2013 14:22:10 -0000
Content-Type: multipart/alternative; boundary=14dae9cdc181bb9e0a04d96138ee

--14dae9cdc181bb9e0a04d96138ee
Content-Type: text/plain; charset=ISO-8859-1

How can I remove qt40embedded-gles from the tisdk-rootfs-image. I do not
feel that I require it, I am looking for a one liner removal but I seem to
be going in circles,
Any pointer would be great


-- 
David Hirst
hirst689@gmail.com

--14dae9cdc181bb9e0a04d96138ee
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div><div><br clear="all"></div>How can I remove qt40embedded-gles from the tisdk-rootfs-image. I do not feel that I require it, I am looking for a one liner removal but I seem to be going in circles,<br></div>
Any pointer would be great<br><br><br><div><div><div>-- <br>David Hirst<br><a href="mailto:hirst689@gmail.com" target="_blank">hirst689@gmail.com</a><br><img src="" alt=""><br>
</div></div></div></div>

--14dae9cdc181bb9e0a04d96138ee--
