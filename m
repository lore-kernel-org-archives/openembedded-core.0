Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id BC24160290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 06:23:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w18so5711199wrv.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 23:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=sUm6B+Rfw0OlumwHtt9n9LxEezrruIkCFcyBSG4rDlE=;
	b=M1Ty2Idwikz8T41haqHK/wjEJ+28LJlIeiJ8R/rIE7NlGAHgUrCNj8Vaad9Exj0NU8
	nNyj71m04Jvv4AdNBO9LsKqusykZeXecMXu+jUVVB8ZZbBdaYPNQ8lPW4uY6NhUg7G2h
	E6y0B1FbA2Kwf2/olp9OVT891/PypjNS/Q3OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=sUm6B+Rfw0OlumwHtt9n9LxEezrruIkCFcyBSG4rDlE=;
	b=P8yngvf3KXM2kC+MFPXFWYIiKkAVbpngGxemFsQdmCpXrVPAsYxNM54Fchok3A8IJ1
	8trCzBWWjLXEaiN0hh30hu89X249dRd03xSN4vI07W95sRphmdkP9sZ1NJSQwV9Sykcl
	1BdOhvtV2WN/v4vADDnYTHMV+G4vFspTGJBakXDRBQzFrYYCeM2rBknxa+NV3wm4IxpU
	UFS0m9/AYEu9SNbBuaD+F6ZApL+ILcH2jvL/MVyA6Eb12TLLGeIM26CT0IHi4srzWgS0
	QrHRekOH1kNYLXV7t5BBpqF0HcZ0/qt6/DdtiyY/4TFsuADUcirY5gjKGv/lPYg6w5jX
	sjvA==
X-Gm-Message-State: APjAAAWjqyhymqUPogk4bZvdTB+x+0yWeDvTQqI9erDKnhRE9bbmNMho
	dGFjG8DzDtcjzz9wrbJAWWJHymE/n0I=
X-Google-Smtp-Source: APXvYqwpnSmjrj3jmKls8r/C5Kn95Aser12MroxO8qySCnE+TTa63JJqaiHpE/OBpDNi7krtyQebYQ==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr1732944wru.227.1555655038053; 
	Thu, 18 Apr 2019 23:23:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r196sm3132258wmf.22.2019.04.18.23.23.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 23:23:57 -0700 (PDT)
Message-ID: <d6639702b73677ac8083516741fc67ccaf068b21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Apr 2019 07:23:56 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Outstanding patches/pings etc
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
X-List-Received-Date: Fri, 19 Apr 2019 06:23:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just wanted to let people know I'm taking a short break over the
weekend so not to expect answers to some of the questions regarding
patches immediately. I know there are a few pings and other questions.
Others like Ross are also away so it will be a quiet time for patches.

Cheers,

Richard



