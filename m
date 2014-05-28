Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (unknown [209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 199056FB95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 15:03:14 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so10488750iec.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T9piWXN1/NwtBje6Mk5W41S6lMkz1ghKV7b7CgG5FMY=;
	b=gCaY+0zvdcbIDg//4+dQTKftIIY3/+OAxGW4+ShYCJPZ/+dl2nfYJ5sXwGduROA7It
	2EDpRvO68n6LjCRycQMC4MUMm7voDZ8IQFx4Nu+RFcHlnJIu1PW01RJ/9mttZ7PiZXWO
	T943KS6cQSiURpEQdJo0LC6UjeC28oReJT6YCQ/t4YgB0FLz4/3VxVPaNW7lTn26Jho0
	oQNbcZPbuGPAzPMT/h1/psu6d+YIY4dahB5OoFy1cgjS5yCPr+kOjDODGsIzwinD2YNw
	w/u3IntD7568l8whqV6DHjaTryHaWaam5XQ7xUsPgtzaNzeDijzF3jrPltzf36OyGPia
	eUvA==
X-Received: by 10.42.50.68 with SMTP id z4mr174928icf.70.1401289395052; Wed,
	28 May 2014 08:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 08:02:44 -0700 (PDT)
In-Reply-To: <CFAB4426.94179%dvhart@linux.intel.com>
References: <cover.1401223100.git.dvhart@linux.intel.com>
	<1401266574.2607.17.camel@ted>
	<CFAB4426.94179%dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 08:02:44 -0700
Message-ID: <CAMKF1srxV0Etkbebeyt3SZUmkczLm8ea0nWWYyxt2O1SappvtA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] i2c-tools: Add i2c-tools to the core
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
X-List-Received-Date: Wed, 28 May 2014 15:03:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 28, 2014 at 7:44 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>
> What follow-up is necessary/appropriate with meta-oe?

send a patch to delete the recipe from meta-openembedded

