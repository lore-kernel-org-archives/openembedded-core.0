Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SzagC-0006xX-5g
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 23:54:08 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Aug 2012 14:42:16 -0700
Received: by obbuo19 with SMTP id uo19so1063529obb.25
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 09 Aug 2012 14:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=iO61ywpRls9ROOFs1NRPOkcafUFrVJ5P2+eVg+e2FMU=;
	b=l2YHmWbbeuyzWFEAnTpLsec/bBCX6Rwp2pgYeE8L/W1oGaf2AI/qRjgZ5SgLu7dCsW
	K0nKr+/LfTdnN9uIZcY/a5hqWV/C2qpvGtJvCEkPoHvc6QiADsxOzPBe4vfesrZu1et9
	oVF+PTal8/dmulaS5rgDhutmHqEkum/TzmL3nQu/7I0pQPVWjjed+FHPeyhPYAZO7dHZ
	9F4QVmwao94ox6LePajjcLePZVQxT9T41IgZo5Dd35P4EUydFCp+eZ6PAt8weO3TY4rL
	JnCRYdfU1RFtvnudAkwyChHVZMu6q8xWlFHy7+YTO+PMc0P6auzKRADD/Z3b1ULcR1bG
	UMeg==
Received: by 10.60.169.134 with SMTP id ae6mr1032121oec.55.1344548535650; Thu,
	09 Aug 2012 14:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Thu, 9 Aug 2012 14:41:55 -0700 (PDT)
In-Reply-To: <CAJTo0LaLdBA4qoUHO8swNM2dBuR6DcUVSxuPDE3ky8wE3iMdPw@mail.gmail.com>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
	<5154002.dhIIyVWEkz@helios>
	<CAJTo0LaLdBA4qoUHO8swNM2dBuR6DcUVSxuPDE3ky8wE3iMdPw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Aug 2012 22:41:55 +0100
Message-ID: <CAJTo0LZW_FDGQwin+tSXRSfBsd8SSw5KuQADEbQe78dPpfjHMw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Saul Wold <saul.wold@intel.com>
X-Gm-Message-State: ALoCoQn5kYVhPX+L1oYNb4IAdfTGLIeouHiNNuWgXLxx71oa601qaQWgbVxgdKv+xXy1+vQew/Lj
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: [PATCH] pimlico: Remove
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
X-List-Received-Date: Thu, 09 Aug 2012 21:54:08 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2012 16:15, Burton, Ross <ross.burton@intel.com> wrote:
> Damn, I split out the meta-yocto changes already.  Pretend these don't
> exist, I'll fix up the branch tonight.

Okay, ross/sato on poky-contrib consists of three commits, the first
of which is for oe-core and the second two are for meta-yocto.

Ross


