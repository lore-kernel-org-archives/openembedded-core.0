Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4D31C6AFB6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:41:09 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so1436018obc.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZHcoREnyVlv7gSLgJTBGKPa4WZMdS178wVQSsUWymRQ=;
	b=Ww0qDjENwv8tgepMjJM12uROtY2KBoGiiMtct1YJWwJ2QItfJ5gcxxq1H0Ro4r40cP
	Dh4ZLsL4F1DJxfsyP0iLqs57y2/denlfxs2VTBmTMRhBwUhKJXjeA65kQf7N4zzz1ZnT
	4LUBXkhuvAbwe1TbuQJJ2/VhtMz5/Nl1oP1nDJVunfLEXZTZ/7HJw/1mdUp7FBv9HLJY
	tf3vmnRY3J9MgMWWEZ+ywRxSaf822inFcK+EQ2mbUhJhMjLzEgo8tM67roYeaTQg4eie
	WH6G4YXahZL6Xuba5yjVqYzS0gVBHjAF/dZmDEsHRh4f8MZ1eEuzrNi6M/ag8aDbSAHF
	4zhQ==
X-Received: by 10.60.41.37 with SMTP id c5mr5335596oel.43.1372934470242; Thu,
	04 Jul 2013 03:41:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 03:40:50 -0700 (PDT)
In-Reply-To: <ed593cb9b242356b10ebd4ced3b1d9b8f5f37134.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
	<ed593cb9b242356b10ebd4ced3b1d9b8f5f37134.1372890071.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 11:40:50 +0100
Message-ID: <CAJTo0LYgjCu7Ooz_cVKKi+aCxQT2GrSKDvV9B054iNOWNYOHxg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQn3YBgBoR/Ax+EI7+MQfsD4As9f5kmRCrPumragEFSp6Kx6nHgM/VfC0ITvlXlTo6YgBVvW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] resolvconf: Update to 1.72
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
X-List-Received-Date: Thu, 04 Jul 2013 10:41:09 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 23:26, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../resolvconf/{resolvconf_1.72.bb => resolvconf_1.73.bb}             | 4 ++--

Typo in commit message.

Ross

