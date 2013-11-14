Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id A91CA6D684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 10:54:02 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id c14so1659197vea.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 02:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QN3FNZDwLarA3aSSOPDjc3PynD0Q7miqGMoa6dg92T8=;
	b=F9wtI+jbsVEVGk0r8A6MdfzsaNlDRwp7R4Wpl1701bxL4njKUiVcJXjBqP0F6ukjnf
	P8wlZzG5LKZpuuXpCLMWVLno42MH2lNj/HO2NmTl8TXfo822/VZGRZF6zS/Q9+HC+jN+
	pUP3x86QA1P6jZsfyHCWzzyA7eqnUbLDSiyAr/uyV+rO3iqmVpBmFAFQlMfwo5xuNGT4
	ifElJjqJKCDqF1hsxAT2e+b5BxGWxGNRdLamIAm/MkKbpd75hBL53sfHu9Ma59BDzg3P
	QI65nQCkDaWCnhTbSJF1KmjhYoFPagOjOXho9ReD2VTEU9epnKQGJl55f6qoebiImtZf
	G/iQ==
X-Gm-Message-State: ALoCoQmuLmQMiljDw50jGylE69SvQWzczoeTMU+8A8q7tpETJ/4usa2pOayFN3q1+uJvkZT8fC12
X-Received: by 10.52.163.65 with SMTP id yg1mr269486vdb.58.1384426443805; Thu,
	14 Nov 2013 02:54:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 14 Nov 2013 02:53:43 -0800 (PST)
In-Reply-To: <5284AA43.6020209@windriver.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-3-git-send-email-hongbo.zhong@windriver.com>
	<CAJTo0LZZhEF5S9anD54RrrVyGe07KkdNhTh1gz=giRJk_n7k7A@mail.gmail.com>
	<5284AA43.6020209@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Nov 2013 10:53:43 +0000
Message-ID: <CAJTo0Lbab4u9vsDjDv1d1H+Jx_RA9tweDQqzYsFvZJQYEc1MNg@mail.gmail.com>
To: Zhong Hongbo <hongbo.zhong@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez4: Fix no moudle named gi.repository and GObject for simpel-agent
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
X-List-Received-Date: Thu, 14 Nov 2013 10:54:02 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2013 10:47, Zhong Hongbo <hongbo.zhong@windriver.com> wrote:
> What status should fill in Upstream-Status.

As I said, "Inappropriate" is suitable here.

Ross

