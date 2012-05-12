Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1STBIE-0008Qx-Mi
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 14:19:26 +0200
Received: by wgbdr1 with SMTP id dr1so3002442wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 05:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dQfDynivWwlISW85GUuyCHAIlN5WykjSLrvSFyC+ecg=;
	b=LF1WwYB2+M1JcCMzXo9hqf6KaEo4Je9ttUwpo3RLYVkon+az0Ehcyvdmua/CeNDgvr
	ykIemt+W8gO3JPA3qAON1jIP2SDphd36QLglQFYbSvF9kYB74zM6DYl1vlBqe6jqF2oR
	f61N2YWACgqPoysrg05iyr6lGheu5aXh5oQau1GudLqy92QFwNyRKu4SFi/PxAoa+Zdl
	d4sEZfCV9RTgidDPPr34go49OZZMzeVm0G5bo0GMaVuxJKMc0KL89HHl4fX8GZzfz/29
	DUSMnvjs5PrCbp8pFCgRofc/OKWq/BLaplIbmiUQtFkL0DczaKcBYKbHVly+jb1h2XHm
	aw7Q==
Received: by 10.216.142.146 with SMTP id i18mr1029718wej.74.1336824570446;
	Sat, 12 May 2012 05:09:30 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bn9sm18356483wib.5.2012.05.12.05.09.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 May 2012 05:09:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336823729-14191-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 12 May 2012 14:09:27 +0200
Message-Id: <1239C828-67B1-41AF-8C84-5BD25CC36AED@dominion.thruhere.net>
References: <1336823299-13967-1-git-send-email-Martin.Jansa@gmail.com>
	<1336823729-14191-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmEmOw9piqJvCkqEzxUMb36X10YdEzX74e3OhtI8aTq3ap+elOsbR0k6bPdTyMpFVpWWRsl
Subject: Re: [PATCHv2] xserver-xorg-lite: disable xmlto like full xserver-xorg does
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
X-List-Received-Date: Sat, 12 May 2012 12:19:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 12 mei 2012, om 13:55 heeft Martin Jansa het volgende geschreven:

> * xmlto-native is unusable (see YOCTO #2416)
> 

Can you please include a (short) description of that #2416 says?




