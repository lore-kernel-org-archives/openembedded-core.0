Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sa2EI-0002hd-NG
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 12:03:42 +0200
Received: by eekd49 with SMTP id d49so245032eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 02:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=4xXvg5Xz3ZVmH6ni1EbsR5XQrC8UKvh1ff+BYI+d1PU=;
	b=G6LpT0vCF5TeOBU6kVqUzLZktS2qA/Gb/KMT0/EYbTHAGu/KOSrWW0Tbc0iRdNLMvm
	IHss7NnyFAHO42Ik6Ms6qhrgMPnkNYig+YXdJnqBm4NOjntUKxgH320Wi1QmWlDJyONj
	hNUsD+SqYuNWNtU+mS9eL8L51K2f9f+whpjAVqViXPNCd/XYKYnSU1RfK5i2jGrNaOTA
	/2b5sfD/ywYGQvMFIGlGbG3m4PMzGvsv3d7J1b0WvwBQJScO9zPtC/4NG8+zPrx3VK5G
	KoxTFXd2qCKMROJdHxB9W+e2GeZL9/RBSHhycMMxBCcoSGqS5MgLrDLu7U8ieea0/130
	JE1A==
Received: by 10.14.188.4 with SMTP id z4mr8687052eem.228.1338458002996;
	Thu, 31 May 2012 02:53:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c51sm8478295eei.12.2012.05.31.02.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 02:53:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1338455868-31804-1-git-send-email-radu.moisan@intel.com>
Date: Thu, 31 May 2012 11:53:20 +0200
Message-Id: <F113D65E-442C-400B-AA87-A3610C52BF12@dominion.thruhere.net>
References: <1338455868-31804-1-git-send-email-radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl8nHQ3hvdwMB4CB96NFwV0XDAlAGWTJ8VelTI12QzETD538i9qS7G3IqhVnojNr6ZZx+Bt
Subject: Re: [PATCH v3] dbus: update to version 1.4.20
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
X-List-Received-Date: Thu, 31 May 2012 10:03:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 31 mei 2012, om 11:17 heeft Radu Moisan het volgende geschreven:

> Unstable version 1.5.12 also supported


This should be split into at least 2 seperate commits.


