Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZZIK-0007u2-T5
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 05:09:56 +0200
Received: by eaal1 with SMTP id l1so1554119eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 19:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=9PKVvOf/v73T5E0jiU8qp+P7LkfQiXtjXlxifdXV/N0=;
	b=AhFY0vPjnOmwtW9PNVfmcQ4QlUIpGt84rgDke5w+Osb9d7HyYIbe+YoAzwV0ZDJbAJ
	tqMp75KH8leCSrwP9ltxE6sq77fhd3YpRtfhp7g4QcB632yzd9UK9jK3S9SpvZL8CBM1
	hpNZ98B3qrebVMzTAkf9fJD0mNK+FOz25aG8H9Co4+Yjm0yP51ukbMjYfohQyIeRyqDr
	fQQPWTpzt1EEDnBazf068wk6xSCnB9sZ/FzYK6OUA4zwqtZsiJKuGiDe5uGZHJnzpIJy
	odk1SS8omsSAFcyEaFx+v+Qll0VEmu7pJM04uJKoJvZbmPUhPxl8EFSC30cB2V6SV6mi
	KKKg==
Received: by 10.14.100.194 with SMTP id z42mr5928684eef.146.1338346778768;
	Tue, 29 May 2012 19:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 29 May 2012 19:59:08 -0700 (PDT)
In-Reply-To: <e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2012 19:59:08 -0700
Message-ID: <CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
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
X-List-Received-Date: Wed, 30 May 2012 03:09:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 29, 2012 at 1:43 PM, Ross Burton <ross.burton@intel.com> wrote:
>
>
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +Signed-off-by: Ross Burton <ross.burton@intel.com>

why remove the old sign-off ?


