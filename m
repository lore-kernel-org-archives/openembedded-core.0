Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8D26B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:01:56 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so7853425vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=QtvNEkf+71eUz+eoCG4Kq7bwUt+zUl/p9RSlRu3XvJs=;
	b=oo+KeeeO1SkRPGmxgmtwqn2sFmi5VUhCcNbYqSlb474aKAOJLAc8Errk67nEd7yVYj
	hqO90fc9+c7eynE+sLxDKQZzLntYSfl25uFMN0QOy5RhKpj1GDWwsWIijMkOrfn0eo5D
	qNnQ1NKAAbw4QFWkqrfJUtedG6hzdzO0UhoRHBknwPfl9sg8M4t78HUIn4tD6EwTj+Ri
	c11g/ChLqh4TDRinTENMrU6BugBz40oiBE0Oa81rAIfM9x9RT51g+U7L4yQE2e2xZwM/
	Sh11e7iGdu/gZfpd9sf5OSY5UC0De3Otptv41MihvSpXKpJzKX1sgPsZoF6pJpFxVTK9
	XzOQ==
X-Received: by 10.52.164.227 with SMTP id yt3mr20921055vdb.107.1373644917203; 
	Fri, 12 Jul 2013 09:01:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 09:01:37 -0700 (PDT)
In-Reply-To: <64f5905504694f462895e22594ff4321ca49097b.1373640113.git.cristian.iorga@intel.com>
References: <cover.1373640113.git.cristian.iorga@intel.com>
	<64f5905504694f462895e22594ff4321ca49097b.1373640113.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 17:01:37 +0100
Message-ID: <CAJTo0LaxB6CFTdYgsye5Rkp9L_B4hybjavKzagn_y97+6WOVOg@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmivrN5yX0OQIbnUPa/r+s2i/hAgXP6Ru+2TzzKWY8JNzEy0eUcFhWyXJVzuk3ilKEw14zm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] bluez5: upgrade to v5.7
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
X-List-Received-Date: Fri, 12 Jul 2013 16:01:57 -0000
Content-Type: text/plain; charset=UTF-8

Please squash this into the commit that introduces bluez5.

Ross

