Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id 986407F31A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 16:59:05 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id j19so28569024otq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=JO1bmNNL6InJ9/IVMOrp/5QFAcRkdUei3/RSDzvdYbw=;
	b=FqhE5oB7QLeV4McHo7uTmONINiPEBg/ZfQ9Ukod3eB7ACwAyQpnotHQzuSiNJ2NekE
	D0Cu8JIo6q5Xsw6LktYuiwqS/ItnG2SiKiwMUv/Hjc6avMonkt8bctzBc0kuD2t8xVlZ
	S9kCByp3zQocprngpohDOmrhQdzcOlHNSAnG+bmr+yOss6R8p+aiaNBG7dK+EmAP7htk
	2Flxb+weFYi2amhxCfMaRRiCuBFngtNM8gbV8UoatAH+jIVpS2AUCTA2SghY5QDASKM6
	1UoQHCOJBU5O1n4KJ1eTe8OCD7owwlK7IraDPWHMZAjdPH3VynI67pgU4NFU70QkJGme
	k8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=JO1bmNNL6InJ9/IVMOrp/5QFAcRkdUei3/RSDzvdYbw=;
	b=LhV7VGQD5hY3PSsl0deBzkZMtlWfEaDLXbdHBlhMYeOnyjoT66LUZWisJqo7ip6EKN
	gHVnH2DM7Qg7kKSNL2dQWNZAhpodoKlCLRbxtMIES3gyUXDzy1PlEjaio0CYvXU/G3SZ
	0YjHBCW1wNzxGZ+ip7wjz4Oko0G3APhncpSG+jz4vzJuv0+jQGrxYOEZFp8epatwoUeP
	kR/NtwMP2QeW/0D/vIp8u3XGGwEs80FtoetunS3xJB1OkVTkWbXVuMuLNmQKNSqnO8r+
	GYabSZhbmv5fPJuJjOzsQYIFXgvvtx+p3gE8Xj5SKffZrqsqmmlUaXmoxet0vrmRmVGC
	xWEA==
X-Gm-Message-State: APjAAAWiiYlIIIgKQgC0kAYZMwCy9KFtszm6AcEqk9scdT33/d+y5kdF
	qGogrCYHlfSRp0xvr/YQXSaKMLCvQTF+21DiRnMySp1cdXA=
X-Google-Smtp-Source: APXvYqx9ug8Rhut+UkrXmRgKI7ydB2ydoAEkW7481JTV3GMrM1QRuGUQTEXE7dBfVdHL7RhHb+Bvdp7yT4B+UZ7/i7w=
X-Received: by 2002:a9d:6282:: with SMTP id x2mr52763820otk.223.1564505946220; 
	Tue, 30 Jul 2019 09:59:06 -0700 (PDT)
MIME-Version: 1.0
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Tue, 30 Jul 2019 19:58:55 +0300
Message-ID: <CAB=otbSH85m0WnBj0Q2z9Bj2ZGwzGzcM74-GuaXtt6PeReP60Q@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: OEDEM 2019
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
X-List-Received-Date: Tue, 30 Jul 2019 16:59:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

Is there any plan to hold an OpenEmbedded developer meting
in Lyon, France around this year's ELCE 2019 (October 28-30)?

I see that OEDEM 2019 page isn't created yet and I didn't find
any news in mailing lists yet:
https://www.openembedded.org/wiki/OEDEM_2019

Thanks,
Ruslan

