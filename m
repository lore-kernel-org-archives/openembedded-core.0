Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sisdo-00076T-BN
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 21:38:36 +0200
Received: by eaal1 with SMTP id l1so1046632eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2012 12:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=F2xlfTltnuHybq8jmtV32QW97pBRvnWrqoKE8Bj4BQQ=;
	b=eas/3JF2gBfOMWp/hr1BBDLVOl3EsOpIsmCqo438lqJK4qwQ5AX8/fyxEiTkz1KWN3
	4ke9Tt49OnYhLeTi2SU/0NFmFMBU10Jv8+yive3agFGa0214cXfSbGDnsUU3GyK9D6O7
	iPwET+G8flHBd9ZCbRPNb9bpsKVihixGI+fExD/mCNz7bZ26ugkJ43G8T/iZq3TaOjGs
	fRCKQMMbROk1qYzCN6WR8PgM/84dwUPub+h0FGqWBu76L/kHI/x8v9S96JHFAcUVeZ1O
	Rnym/xR2YIm27PjPZtxUJj1HKlb1vuBKmaNvRPMEBCvHIZ07/yuuvNiuyyf39TWKwQOt
	Mhhg==
Received: by 10.14.48.77 with SMTP id u53mr1896309eeb.87.1340566066295;
	Sun, 24 Jun 2012 12:27:46 -0700 (PDT)
Received: from ?IPv6:2001:610:612::8c2e:b89:1582:ac78?
	([2001:610:612:0:8c2e:b89:1582:ac78])
	by mx.google.com with ESMTPS id q53sm131727604eef.8.2012.06.24.12.27.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 12:27:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
Date: Sun, 24 Jun 2012 21:27:44 +0200
Message-Id: <B0A816B5-77AF-4371-AAC8-FF4A4D78D0A9@dominion.thruhere.net>
References: <cover.1340560914.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnFnpb8cytXWMLKhvZsThgxvHp9KELTJWyN6Ii/aHWeGSSNfF7illromK5YkjpsZFAhAi8p
Subject: Re: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Sun, 24 Jun 2012 19:38:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 24 jun. 2012, om 20:03 heeft Saul Wold het volgende geschreven:

> Richard,
> 
> Here is a patch of updates.

How were those tested?


